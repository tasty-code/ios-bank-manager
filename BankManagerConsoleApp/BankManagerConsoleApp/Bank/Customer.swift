//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by dopamint on 1/31/24.
//
final class Customer {
    let number: Int
    let taskType: TaskType
    
    init?(number: Int) {
        self.number = number
        guard let randomTaskType = TaskType.allCases.randomElement() else {
            return nil
        }
        self.taskType = randomTaskType
    }
}
