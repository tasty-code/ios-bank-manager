//
//  Counter.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/03/07.
//

import Foundation

class Counter {
    private var numberOfAccountCustomers = 0
    private var numberOfLoanCustomers = 0

    func addAccountCustomer(with AccountCustomers: Int) {
        numberOfAccountCustomers += AccountCustomers
    }

    func addLoanCustomer(with LoanCustomers: Int) {
        numberOfLoanCustomers += LoanCustomers
    }

    func getAccountCustomerCount() -> Int {
        return numberOfAccountCustomers
    }

    func getLoanCustomerCount() -> Int {
        return numberOfLoanCustomers
    }

    func resetCounter() {
        numberOfAccountCustomers = 0
        numberOfLoanCustomers = 0
    }
}
