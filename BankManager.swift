//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager {
    
    private let numberOfGuest: UInt = BankAbility.numberOfCustomer
    private let waitingQueue: WaitingQueue<CustomerInfo>
    
    // MARK: - init
    
    init(waitingQueue: WaitingQueue<CustomerInfo>) {
        self.waitingQueue = waitingQueue
    }
    
}

extension BankManager {
    
    private func generateWaitingCustomers(customers: UInt, to waitingQueue: WaitingQueue<CustomerInfo>) {
        (1...customers).forEach { number in
            let newCustomer = CustomerInfo(number: number)
            waitingQueue.enqueue(newCustomer)
        }
    }
    
    private func finalReport() {
        InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * BankAbility.taskDuration(of: .deposit)))
    }
    
}

extension BankManager: BankProtocol {
    
    func open() {
        generateWaitingCustomers(customers: numberOfGuest, to: waitingQueue)
        
        let group = DispatchGroup()
        
        let telle1 = DispatchSemaphore(value: 1)
        let telle2 = DispatchSemaphore(value: 3)

        while let customer = waitingQueue.dequeue() {
            group.enter()
            if customer.task == BankAbility.taskType.deposit {
                DispatchQueue.global().async(group: group, execute: makeWorkItem(number: customer.number, task: customer.task, semaphore: telle1))
                group.leave()
            } else {
                DispatchQueue.global().async(group: group, execute: makeWorkItem(number: customer.number, task: customer.task, semaphore: telle2))
                group.leave()
            }

        }
        group.wait()
        close()
    }
    
    func makeWorkItem(number: UInt, task: BankAbility.taskType, semaphore: DispatchSemaphore) -> DispatchWorkItem {
        let workItem = DispatchWorkItem {
            semaphore.wait()
            print("\(number) : \(task)실행중")
            BankAbility.taskDuration(of: task).sleep()
            semaphore.signal()
        }
        return workItem
    }
    
    func close() {
        finalReport()
    }
    
    func report(waitingNumber: UInt, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, inProgress))
    }

}

extension BankManager: TellerProtocol {
    
    func work() {
        BankAbility.taskDuration(of: .loan).sleep()

    }
    
}
