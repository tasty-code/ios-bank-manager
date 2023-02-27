//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager: Receivable {
    func execute() {
        print(Message.menu)
        print(Message.inputLabel, terminator: "")

        guard let userInput = getUserInput() else { return }

        switch SystemMenu(rawValue: userInput) {
        case .open:
            openBank()
            execute()
        case .close:
            break
        case .none:
            break
        }
    }

    func makeRandomNumber() -> Int { Int.random(in: (10...30)) }

    func openBank() {
        let processingTimePerPerson = Banker.processingTime
        let randomNumber = makeRandomNumber()
        let customerQueue = LinkedQueue<Customer>()

        for waitingNumber in 1...randomNumber {
            customerQueue.enqueue(value: Customer(waitingOrder: waitingNumber))
        }

        while !customerQueue.isEmpty() {
            let currentCustomer = customerQueue.dequeue()

            guard let currentCustomerNumber = currentCustomer?.waitingOrder else { return }

            print(Message.workStart(currentCustomerNumber))
            Thread.sleep(forTimeInterval: processingTimePerPerson)
            print(Message.workComplete(currentCustomerNumber))
        }

        print(Message.bankClose(randomNumber, processingTimePerPerson))
    }
}
