//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank

    init() {
        let bankTeller = BankTeller()
        self.bank = Bank(bankTellers: [bankTeller])
    }

    mutating func open() {
        let customers = generateRandomCustomers()
        bank.visit(customers: customers)

        bank.startWorking()

        ConsoleManager.presentAllTaskFinished(of: customers)
    }

    private func generateRandomCustomers() -> [Customer] {
        let randomNumber = Int.random(in: 10...30)

        var customers: [Customer] = []
        for id in 1...randomNumber {
            customers.append(Customer(id: id, withTotalTime: 0.7))
        }

        return customers
    }
}
