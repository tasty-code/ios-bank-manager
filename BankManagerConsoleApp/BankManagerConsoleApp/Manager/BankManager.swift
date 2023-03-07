//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {

    // MARK: - Private property

    private var bank: Bank

    private enum Constants {
        static let minimumValueOfRandomCustomers = 10
        static let maximumValueOfRandomCustomers = 30
        static let defaultTimespent = 0.7
    }

    // MARK: - Lifecycle

    init() {
        let bankTellers = [
            BankTeller(workType: .deposit),
            BankTeller(workType: .deposit),
            BankTeller(workType: .loan)
        ]

        self.bank = Bank(bankTellers: bankTellers)
    }

    // MARK: - Public

    func open(completion: @escaping () -> Void) {
        let customers = generateRandomCustomers()
        bank.visit(customers: customers)

        bank.startWorking(completion: {
            ConsoleManager.presentAllTaskFinished(of: customers)
        })
    }

    // MARK: - Private

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
