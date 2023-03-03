//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/23.
//

import Foundation

struct Bank {
    private var bankTellers: [BankTeller]
    private var customersQueue: Queue<Customer> = Queue()

    init(bankTellers: [BankTeller]) {
        self.bankTellers = bankTellers
    }

    mutating func visit(customers: [Customer]) {
        customers.forEach {
            customersQueue.enqueue($0)
        }
    }

    mutating func startWorking() {
        for _ in 0..<customersQueue.count {
            guard let customer = customersQueue.peek else { continue }
            
            bankTellers.first?.performTask(of: customer)
            customersQueue.dequeue()
        }
    }
}
