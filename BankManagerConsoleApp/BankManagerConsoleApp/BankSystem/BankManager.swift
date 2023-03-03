//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager {
    
    private let numberOfGuest: UInt = CustomerConstant.numberOfCustomer
    private let waitingQueue: WaitingQueue<CustomerInfo>
    
    // MARK: - init
    
    init(waitingQueue: WaitingQueue<CustomerInfo>) {
        self.waitingQueue = waitingQueue
    }
    
}

extension BankManager {
    
    private func generateWaiting(customers: UInt, to waitingQueue: WaitingQueue<CustomerInfo>) {
        (1...customers).forEach { number in
            let newCustomer = CustomerInfo(number: number)
            waitingQueue.enqueue(newCustomer)
        }
    }
    
    private func finalReport() {
        InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * Task.duration(of: .deposit)))
    }
    
}

extension BankManager: BankProtocol {
    
    func open() {
        generateWaiting(customers: numberOfGuest, to: waitingQueue)
        
        let group = DispatchGroup()
        
        let telle1 = DispatchSemaphore(value: 1)
        let telle2 = DispatchSemaphore(value: 3)

        while let customer = waitingQueue.dequeue() {
            group.enter()
            
            switch customer.task {
            case .deposit:
                DispatchQueue.global().async(group: group, execute: makeWorkItem(number: customer.number, task: customer.task, semaphore: telle1))
                group.leave()
            case .loan:
                DispatchQueue.global().async(group: group, execute: makeWorkItem(number: customer.number, task: customer.task, semaphore: telle2))
                group.leave()
            }

        }
        group.wait()
        close()
    }
    
    func makeWorkItem(number: UInt, task: Task, semaphore: DispatchSemaphore) -> DispatchWorkItem {
        let workItem = DispatchWorkItem {
            semaphore.wait()
            print("\(number) : \(task.rawValue) 실행")
            Task.duration(of: task).sleep()
            semaphore.signal()
            print("\(number) : \(task.rawValue) 종료")
        }
        return workItem
    }
    
    func close() {
        finalReport()
    }
    
    func report(waitingNumber: UInt, task: Task, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, task.rawValue, inProgress))
    }

}

extension BankManager: TellerProtocol {
    
    func work() {
        Task.duration(of: .loan).sleep()
    }
    
}
