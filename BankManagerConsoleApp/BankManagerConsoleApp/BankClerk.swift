//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

struct BankClerk {    
    func work(for customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: 0.7)
        }
        print("\(customer.number)번 고객 업무 완료")
    }
}
