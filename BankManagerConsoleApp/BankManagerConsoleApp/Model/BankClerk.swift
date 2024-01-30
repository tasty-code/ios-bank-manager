//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Jin-Mac on 1/30/24.
//
import Foundation

struct BankClerk {
    func work(for customer: Customer) {
        print(BankMessage.start(customer.number).description)
        Thread.sleep(forTimeInterval: 0.7)
        print(BankMessage.done(customer.number).description)
    }
}
