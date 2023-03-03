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
    
    private func finalReport() {
        InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * Task.duration(of: .deposit)))
    }
    
}

extension BankManager: BankProtocol {
    
    func open() {
        generateWaiting(customers: numberOfGuest, to: waitingQueue)
        
        let group = DispatchGroup()
        while let customer = waitingQueue.dequeue() {
            group.enter()
            
            let teller = tellers.filter { teller in
                teller.task == customer.task
            }.first
            
            DispatchQueue.global().async(
                group: group,
                execute: makeWorkItem(number: customer.number, teller: teller!)
            )
            group.leave()
        }
        group.wait()
        close()
    }
    
    func makeWorkItem(number: UInt, teller: Teller) -> DispatchWorkItem {
        let workItem = DispatchWorkItem {
            teller.semaphore.wait()
            teller.report(waitingNumber: number, task: teller.task, inProgress: true)
            teller.work()
            teller.semaphore.signal()
            teller.report(waitingNumber: number, task: teller.task, inProgress: false)
        }
        return workItem
    }
    
    func close() {
        finalReport()
    }
    
}
