//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by Bora Yang on 2023/02/24.
//

import Foundation

enum ConsoleManager {
    static func presentTaskStarted(of customer: Customer) {
        print("\(customer.id)번 고객 업무 시작")
    }

    static func presentTaskFinished(of customer: Customer) {
        print("\(customer.id)번 고객 업무 완료")
    }

    static func presentAllTaskFinished(of customers: [Customer]) {
        let numberOfCustomers = customers.count

        let totalTimeOfCustomers = customers
            .map { $0.totalTime }
            .reduce(0, +)
            .round(toPlaces: 3)

        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(totalTimeOfCustomers)초입니다.")
    }
}
