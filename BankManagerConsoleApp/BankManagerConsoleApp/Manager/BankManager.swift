//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank

    init() {
        let bankTeller = BankTeller()
        self.bank = Bank(bankTellers: [bankTeller])
    }

    mutating func open() {
        let customers = generateRandomCustomers()
        bank.visit(customers: customers)

        bank.startWorking()

        notifyWorkCompleted(of: customers)
    }

    private func generateRandomCustomers() -> [Customer] {
        let randomNumber = Int.random(in: 10...30)

        var customers: [Customer] = []
        for id in 1...randomNumber {
            customers.append(Customer(id: id, withTotalTime: 0.7))
        }

        return customers
    }

    private func notifyWorkCompleted(of customers: [Customer]) {
        let numberOfCustomers = customers.count

        let totalTimeOfCustomers = customers
            .map { $0.totalTime }
            .reduce(0, +)
            .round(toPlaces: 3)

        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(totalTimeOfCustomers)초입니다.")
    }
}
