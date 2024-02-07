//
//  Customer.swift
//  BankManagerUIApp
//
//  Created by ㅣ on 2/7/24.
//

import Foundation

struct Client {
    let number: Int
    let bankTask: BankTask
    
    init(number: Int, bankTask: BankTask) {
        self.number = number
        self.bankTask = bankTask
    }
}
