//
//  CustomerInfo.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

struct Customer {
    
    let number: UInt
    let task: Task
    
    init(number: UInt) {
        self.task =  Task.randomTask()
        self.number = number
    }
    
}
