//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/23.
//

import Foundation

struct Bank {
    private var bankTellers: [BankTeller]

    init(bankTellers: [BankTeller]) {
        self.bankTellers = bankTellers
    }

    mutating func visit(customer: Customer) {
        guard !bankTellers.isEmpty else { return }
        bankTellers[0].assign(customer: customer)
    }

    mutating func startWorking() {
        bankTellers[0].performTask()
    }
}
