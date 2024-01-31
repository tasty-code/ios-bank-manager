//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by dopamint on 1/31/24.
//

import Foundation

class Bank {
    let banker = Banker()
    var customerQueue = Queue<Customer>()

    func open() {
        print("은행 문이 열렸습니다.")
        let numberOfCustomers = Int.random(in: 10...30)

        print("고객 수: \(numberOfCustomers)")
        for customerNumber in 1...numberOfCustomers {
            let customer = Customer(number: customerNumber)
            customerQueue.enqueue(customer)
        }

        processCustomers()
        let totalDurationTimeFormatted = banker.totalDuration.formattedDecimal
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(totalDurationTimeFormatted)초입니다.")
        banker.totalDuration = 0.0
    }

    func processCustomers() {
        while !customerQueue.isEmpty() {
            if let customer = customerQueue.dequeue() {
                banker.processCustomer(customer)
            }
        }
    }
}

