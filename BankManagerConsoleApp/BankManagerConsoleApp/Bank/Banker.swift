//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by dopamint on 1/31/24.
//

import Foundation

final class Banker {
    let duration = 0.7
    var totalDuration = 0.0
    func processCustomer(_ customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: duration)
        print("\(customer.number)번 고객 업무 끝")
        totalDuration += duration
    }
}
