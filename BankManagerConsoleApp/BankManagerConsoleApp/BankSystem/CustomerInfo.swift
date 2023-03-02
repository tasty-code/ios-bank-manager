//
//  CustomerInfo.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

struct CustomerInfo {
    
    //MARK: - Properties
    
    let number: UInt
    let task: Task
    
    //MARK: - LifeCycle
    
    init(number: UInt) {
        self.task =  Task.getRandomTask()
        self.number = number
    }
    
}
