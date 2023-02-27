//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by Bora Yang on 2023/02/23.
//

import Foundation

struct BankTeller {
    private let microSecondsPerSeconds = 1_000_000.0

    func performTask(of customer: Customer) {
        ConsoleManager.presentTaskStarted(of: customer)

        let secondsOfTask = useconds_t(customer.timespent * microSecondsPerSeconds)
        usleep(secondsOfTask)
        ConsoleManager.presentTaskFinished(of: customer)
    }
}
