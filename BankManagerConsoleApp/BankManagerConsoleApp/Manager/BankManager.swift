//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank

    private enum Constants {
        static let minimumValueOfRandomCustomers = 10
        static let maximumValueOfRandomCustomers = 30
        static let defaultTimespent = 0.7
    }

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
        let range = Constants.minimumValueOfRandomCustomers...Constants.maximumValueOfRandomCustomers
        let randomNumber = Int.random(in: range)

        var customers: [Customer] = []
        for id in 1...randomNumber {
            let workType = WorkType.allCases.randomElement() ?? .deposit
            customers.append(Customer(id: id, workType: workType))
        }

        return customers
    }
}
