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
    
    init(customerQueue: Q, consoleMessage: ConsoleMessage) {
        self.customerQueue = customerQueue
        self.consoleMessage = consoleMessage
    }
    
    /// 고객 업무 시작
    func open(completion: @escaping () -> Void) {
        let numberOfCustomers = Int.random(in: 10...30)
        for number in 1...numberOfCustomers {
            customerQueue.enqueue(Customer(waitingNumber: number))
        }
        totalCustomers = numberOfCustomers
        processCustomers {
            self.closed(completion: completion)
        }
    }
    
    /// 고객 업무 처리
    private func processCustomers(completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        
        while let customer = customerQueue.dequeue() {
            dispatchGroup.enter()
            consoleMessage.taskStartMessage(customerNumber: customer.waitingNumber)
            
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.7) {
                self.consoleMessage.teskEndMessage(customerNumber: customer.waitingNumber)
                dispatchGroup.leave()
            }
            dispatchGroup.wait()
        }

        dispatchGroup.notify(queue: .global()) {
            completion()
        }
    }
    
    /// 업무가 마감됨
    private func closed(completion: @escaping () -> Void) {
        let totalTime = Double(totalCustomers) * 0.7
        consoleMessage.bankClosingMessage(totalCustomers: totalCustomers, time: totalTime)
        completion()
    }
}
