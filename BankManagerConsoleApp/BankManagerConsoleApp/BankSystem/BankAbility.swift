//
//  BankAbility.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

enum BankAbility {
    
    enum CustomerConstant {
        
        static let min: UInt = 10
        static let max: UInt = 30
        
    }
    
    enum taskType: String, CaseIterable {
        
        case deposit = "예금"
        case loan = "대출"
        
        var numberOfTeller: UInt {
            switch self {
            case .deposit:
                return 1
            case .loan:
                return 1
            }
        }
        
    }
    
}


extension BankAbility {
    
    //MARK: - Properties
    
    static var numberOfCustomer: UInt {
        guard let customerSum = (CustomerConstant.min...CustomerConstant.max).randomElement() else { return 0 }
        return customerSum
    }
    
    //MARK: - Methodes
    
    static func getRandomTask() -> taskType {
        let tasks = taskType.allCases
        guard let task = tasks.randomElement() else { return taskType.deposit }
        return task
    }
    
    static func taskDuration(of taskType:BankAbility.taskType) -> Double {
        switch taskType {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
}

