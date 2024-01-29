//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

struct BankClerk {
    func work(for customer: Customer) {
        print(workMessage.start(customer.number).show)
        Thread.sleep(forTimeInterval: 0.7)
        print(workMessage.done(customer.number).show)
    }
}
