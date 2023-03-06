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
    
    private func dealCustomer(group: DispatchGroup, completion: @escaping (CustomerInfo, Bool)->Void) {
        
        let queue = DispatchQueue.global()
        let tellers = Task.allCases.map { Teller(task: $0) }
        
        while let customer = waitingQueue.dequeue() {
            group.enter()
            guard let teller = tellers.first(where: { $0.task == customer.task }) else { return }
            
            queue.async(group: group) {
                teller.makeWorkItem() { bool in
                    completion(customer, bool)
                }
            }
            
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
        dealCustomer(group: group) { result,bool  in
            report(waitingNumber: result.number, task: result.task, inProgress: bool)
        }
        group.wait()
        close()
    }
    
    func close() {
        finalReport()
    }
    
}
