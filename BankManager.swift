//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager: BankProtocol {
    
    private let numberOfGuest: UInt = BankAbility.CustomerAmount.numberOfCustomer
    private let waitingQueue: WaitingManager<customerInfo>
    
    // MARK: - init
    
    init(
        waitingQueue: WaitingManager<customerInfo>
    ) {
        self.waitingQueue = waitingQueue
    }
    // MARK: - Public
    
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
    
    func working() {
        BankAbility.taskDuration.sleep()
    }
    
    func report(waitingNumber: UInt, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, inProgress))
    }
    
}

extension BankManager {
    private func greeting(customers: UInt, to waitingQueue: WaitingManager<customerInfo>) {
        (1...customers).forEach { number in
            let newCustomer = Customer()
            let newData: customerInfo = (number, newCustomer)
            waitingQueue.enqueue(newData)
        }
    }
    
    private func finalReport() {
        InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * BankAbility.taskDuration))
    }
}
