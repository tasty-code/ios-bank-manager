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
        Thread.sleep(forTimeInterval: BankWorkType.loan.time)
    }
}

struct BankDepositClerk: BankWork {
    func work(for customer: Customer) {
        Thread.sleep(forTimeInterval: BankWorkType.deposit.time)
    }
}
