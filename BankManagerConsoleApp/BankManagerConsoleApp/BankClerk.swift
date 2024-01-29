//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

protocol WorkAble {
    func work(for customer: Customer)
}

struct BankClerk: WorkAble {
    func work(for customer: Customer) {
        print(BankMessage.start(customer.number).show)
        Thread.sleep(forTimeInterval: 0.7)
        print(BankMessage.done(customer.number).show)
    }
}
