//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

protocol BankWork {
    func work(for customer: Customer)
}

struct BankLoanClerk: BankWork {
    func work(for customer: Customer) {
        Thread.sleep(forTimeInterval: 1.1)
    }
}

struct BankDepositClerk: BankWork {
    func work(for customer: Customer) {
        Thread.sleep(forTimeInterval: 0.7)
    }
}
