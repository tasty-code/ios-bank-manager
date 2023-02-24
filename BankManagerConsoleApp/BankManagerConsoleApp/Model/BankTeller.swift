//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by Bora Yang on 2023/02/23.
//

import Foundation

struct BankTeller {
    func performTask(of customer: Customer) {
        ConsolePresenter.startWorking(customerID: customer.id)

        let milliSeconds = (customer.totalTime * 1_000_000.0)
        usleep(useconds_t(milliSeconds))
        ConsolePresenter.finishedWorking(customerID: customer.id)
    }
}
