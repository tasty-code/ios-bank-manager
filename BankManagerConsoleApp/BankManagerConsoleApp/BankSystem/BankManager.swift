//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager {
    
    private let numberOfGuest: UInt = CustomerConstant.numberOfCustomer
    private let waitingQueue: WaitingQueue<CustomerInfo>
    private let tellers: [Teller]
    
    // MARK: - init
    
    init(waitingQueue: WaitingQueue<CustomerInfo>) {
        self.waitingQueue = waitingQueue
        self.tellers = Task.allCases.map { Teller(task: $0) }
    }
    
}

extension BankManager {
    
    private func generateWaiting(customers: UInt, to waitingQueue: WaitingQueue<CustomerInfo>) {
        (1...customers).forEach { number in
            let newCustomer = CustomerInfo(number: number)
            waitingQueue.enqueue(newCustomer)
        }
    }
    
    private func makeWorkItem(number: UInt, teller: Teller) -> DispatchWorkItem {
        let workItem = DispatchWorkItem {
            teller.semaphore.wait()
            report(waitingNumber: number, task: teller.task, inProgress: true)
            teller.work()
            teller.semaphore.signal()
            report(waitingNumber: number, task: teller.task, inProgress: false)
        }
        return workItem
    }
    
    private func dealCustomer(group: DispatchGroup) {
        
        let queue = DispatchQueue.global()
        
        while let customer = waitingQueue.dequeue() {
            group.enter()
            guard let teller = tellers.first(where: { $0.task == customer.task }) else { return }
            
            queue.async(
                group: group,
                execute: makeWorkItem(number: customer.number, teller: teller)
            )
            group.leave()
        }
    }
    
    private func report(waitingNumber: UInt, task: Task, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, task.rawValue, inProgress))
    }
    
    private func finalReport() {
        InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * Task.duration(of: .deposit)))
    }
    
}

extension BankManager: BankProtocol {
    
    func open() {
        generateWaiting(customers: numberOfGuest, to: waitingQueue)
        
        let group = DispatchGroup()
        dealCustomer(group: group)
        group.wait()
        close()
    }
    
    func close() {
        finalReport()
    }
    
}
