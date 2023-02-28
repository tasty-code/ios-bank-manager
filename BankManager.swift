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
    
    private func greeting(customers: UInt, to waitingQueue: WaitingQueue<CustomerInfo>) {
        (1...customers).forEach { number in
            let newCustomer = Customer()
            let newData: CustomerInfo = CustomerInfo(number: number, customer: newCustomer)
            waitingQueue.enqueue(newData)
        }
    }
    
    private func finalReport() {
        InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * BankAbility.taskDuration(of: .deposit)))
    }
    
}

extension BankManager: BankProtocol {
    
    func open() {
        greeting(customers: numberOfGuest, to: waitingQueue)
        while let waitingNumber = waitingQueue.dequeue()?.number {
            self.report(waitingNumber: waitingNumber, inProgress: true)
            self.working()
            self.report(waitingNumber: waitingNumber, inProgress: false)
        }
        close()
    }
    
    func close() {
        finalReport()
    }
    
    func report(waitingNumber: UInt, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, inProgress))
    }

}

extension BankManager: TellerProtocol {
    
    func working() {
        BankAbility.taskDuration(of: .loan).sleep()
    }
    
}
