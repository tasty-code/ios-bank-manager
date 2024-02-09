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
    let workType: BankWorkType
    
    init(workType: BankWorkType) {
        self.workType = workType
    }
    
    func work(for customer: Customer) {
        Thread.sleep(forTimeInterval: workType.time)
    }
}
