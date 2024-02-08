//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Jin-Mac on 1/30/24.
//

struct Customer: Equatable {
    let number: Int
    let task: Banking
    
    init(number: Int, task: Banking) {
        self.number = number
        self.task = task
    }
}
