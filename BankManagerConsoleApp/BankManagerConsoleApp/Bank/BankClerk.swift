//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

protocol BankWork {
    func work(for customer: Customer)
}

struct BankClerk: BankWork {
    func work(for customer: Customer) {
        printMessage(BankMessage.start(customer.number).show)
        wait(for: 0.7)
        printMessage(BankMessage.done(customer.number).show)
    }

    private func wait(for timeInterval: TimeInterval) {
        Thread.sleep(forTimeInterval: timeInterval)
    }

    private func printMessage(_ message: String) {
        print(message)
    }
}
