//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 루피, 진 on 1/30/24.
//
import Foundation

struct BankClerk {
    
    func depositWorking(for customer: Customer) {
        print(BankMessage.start(customer.number, "예금").description)
        Thread.sleep(forTimeInterval: 0.7)
        print(BankMessage.done(customer.number, "예금").description)
    }
    
    func lendWorking(for customer: Customer) {
        print(BankMessage.start(customer.number, "대출").description)
        Thread.sleep(forTimeInterval: 1.1)
        print(BankMessage.done(customer.number, "대출").description)
    }
}
