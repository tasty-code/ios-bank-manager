//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by Bora Yang on 2023/02/23.
//

import Foundation

struct BankTeller {
    func performTask(of customer: Customer) {
        print("\(customer.id)번 고객 업무 시작")

        let milliSeconds = (customer.totalTime * 1_000_000.0)
        usleep(useconds_t(milliSeconds))
        print("\(customer.id)번 고객 업무 완료")
    }
}
