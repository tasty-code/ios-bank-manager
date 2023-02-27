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
        
        (1...numberOfGuest).forEach { number in
            let newCustomer = Customer()
            let newData: customerInfo = (number, newCustomer)
            waitingQueue.enqueue(newData)
        }
        
        while let waitingNumber = waitingQueue.dequeue()?.number {
            self.report(waitingNumber: waitingNumber, inProgress: true)
            self.working()
            self.report(waitingNumber: waitingNumber, inProgress: false)
        }
        close()
    }
    
    func close() {
        InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * BankAbility.workTime))
    }
    
    func working() {
        BankAbility.workTime.sleep()
    }
    
    func report(waitingNumber: UInt, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, inProgress))
    }
}
