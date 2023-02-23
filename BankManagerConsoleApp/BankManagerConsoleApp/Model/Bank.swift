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

    mutating func visit(customers: [Customer]) {
        guard !bankTellers.isEmpty else { return }

        customers.forEach {
            bankTellers[0].assign(customer: $0)
        }
    }

    mutating func startWorking() {
        bankTellers[0].performTask {
            print("대충 업무 완료 일단...")
        }
    }
}
