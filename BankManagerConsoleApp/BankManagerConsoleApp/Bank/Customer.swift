//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by nayeon  on 2024/01/27.
//

import Foundation

struct Customer {
    let number: Int
    let purpose: BankWorkType
    
    init(number: Int, purpose: BankWorkType) {
        self.number = number
        self.purpose = purpose
    }
}
