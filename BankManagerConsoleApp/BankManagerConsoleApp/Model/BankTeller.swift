//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by Bora Yang on 2023/02/23.
//

import Foundation

struct BankTeller {
    func performTask(of customer: Customer) {
        ConsoleManager.presentTaskStarted(of: customer)

        Thread.sleep(forTimeInterval: customer.timespent)
        ConsoleManager.presentTaskFinished(of: customer)
    }
}
