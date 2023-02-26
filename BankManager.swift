//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation 

struct BankManager: BankProtocol {
       private let teller: TellerProvidable = Teller()
       private let numberOfGuest: UInt = Namespace.numberOfCustomer
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
               teller.call(waitingNumber: waitingNumber, result: true)
               
               teller.working()
               
               teller.call(waitingNumber: waitingNumber, result: false)
           }
           close()
       }
       
       func close() {
           InputOutputManager.output(state: .close(numberOfGuest, Double(numberOfGuest) * Namespace.workTime))
       }
}
