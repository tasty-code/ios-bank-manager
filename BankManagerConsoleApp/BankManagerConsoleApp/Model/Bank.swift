//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 박찬호 on 1/30/24.
//

import Foundation

final class Bank<Q: QueueProtocol> where Q.Element == Customer {
    private var customerQueue: Q
    private let consoleMessage: ConsoleMessage
    private var totalCustomers: Int = 0
    private var totalTime : Double = 0
    private let depositSemaphore = DispatchSemaphore(value: 2)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    
    init(customerQueue: Q, consoleMessage: ConsoleMessage) {
        self.customerQueue = customerQueue
        self.consoleMessage = consoleMessage
    }
    
    /// 고객 업무 시작
    func open(completion: @escaping () -> Void) {
        let numberOfCustomers = Int.random(in: 10...30)
        for number in 1...numberOfCustomers {
            let task = Bool.random() ? TaskType.deposit : TaskType.loan
            customerQueue.enqueue(Customer(waitingNumber: number, task: task))
        }
        totalCustomers = numberOfCustomers
        
        processCustomer {
            self.closed(totalTime: self.totalTime, completion: completion)
        }
    }
    
    /// 고객 업무를 비동기 적으로 처리
    func processCustomer(completion: @escaping () -> Void) {
        let queue = DispatchQueue.global()
        let group = DispatchGroup()
        let startTime = DispatchTime.now()
        
        for _ in 1...totalCustomers {
            guard let customer = customerQueue.dequeue() else { continue }
            
            group.enter()
            
            let semaphore = customer.task == .deposit ? depositSemaphore : loanSemaphore
            semaphore.wait()
            queue.async(group: group) {
                self.handleCustomer(customer, queue) {
                    semaphore.signal()
                    group.leave()
                }
            }
        }
        
        group.notify(queue: queue) {
            let endTime = DispatchTime.now()
            self.totalTime = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
            completion()
        }
    }
    
    /// 업무 처리
    func handleCustomer(_ customer: Customer, _ queue: DispatchQueue, completion: @escaping () -> Void) {
        self.consoleMessage.taskStartMessage(customerNumber: customer.waitingNumber, task: customer.task.description)
        
        let delay = customer.task == .deposit ? 0.7 : 1.1
        queue.asyncAfter(deadline: .now() + delay) {
            self.consoleMessage.taskEndMessage(customerNumber: customer.waitingNumber, task: customer.task.description)
            completion()
        }
    }
    
    /// 업무가 마감됨
    func closed(totalTime: Double, completion: @escaping () -> Void) {
        consoleMessage.bankClosingMessage(totalCustomers: totalCustomers, time: totalTime)
        completion()
    }
}
