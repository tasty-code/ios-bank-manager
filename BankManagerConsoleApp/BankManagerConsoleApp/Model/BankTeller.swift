//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by Bora Yang on 2023/02/23.
//

import Foundation

struct BankTeller {
    private var customersQueue: Queue<Customer> = Queue()

    mutating func assign(customer: Customer) {
        customersQueue.enqueue(customer)
    }

    mutating func performTask() {
        while !customersQueue.isEmpty {
            let milliSeconds = (customersQueue.peek?.totalTime ?? 0 * 1_000_000.0)
            usleep(useconds_t(milliSeconds))
            customersQueue.dequeue()
        }
    }
}
