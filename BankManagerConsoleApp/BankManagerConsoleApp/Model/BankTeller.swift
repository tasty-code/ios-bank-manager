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

    mutating func performTask(completion: @escaping () -> Void) {
        while !customersQueue.isEmpty {
            guard let customer = customersQueue.peek else { continue }
            let milliSeconds = (customer.totalTime * 1_000_000.0)

            print("\(customer.id)번 고객 업무 시작")
            usleep(useconds_t(milliSeconds))

            print("\(customer.id)번 고객 업무 완료")
            customersQueue.dequeue()
        }

        completion()
    }
}
