//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/23.
//

import Foundation

struct Bank {
    private var numberOfBankTellers: UInt
    private var customersQueue: Queue<Customer> = Queue()

    mutating func visit(customer: Customer) {
        customersQueue.enqueue(customer)
    }

    mutating func performTask() {
        customersQueue.dequeue()
    }
}
