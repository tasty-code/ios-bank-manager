//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager: Receivable {

    func startBusiness() {
        print(Message.menu)
        print(Message.inputLabel, terminator: "")

        guard let userInput = getUserInput() else { return }

        switch SystemMenu(rawValue: userInput) {
        case .open:
            bankOpen()
        case .close:
            break
        case .none:
            break
        }
    }

    func makeRandomNumber() -> Int { Int.random(in: (10...30)) }

    func bankOpen() {
        let randomNumber = makeRandomNumber()
        let customerQueue = LinkedQueue<Any>()
        for waitingNumber in 1...randomNumber {
            customerQueue.enqueue(value: Node(value: Customer(waitingOrder: waitingNumber)))
        }

        while !customerQueue.isEmpty() {
            var currentCustomer = customerQueue.dequeue() as? Customer // Customer
            guard let currentCustomerNumber = currentCustomer?.waitingOrder else { return }
            print(Message.workStart(currentCustomerNumber))
            
            print(Message.workComplete(currentCustomerNumber))
        }
        print(Message.bankClose(randomNumber))
    }
}
