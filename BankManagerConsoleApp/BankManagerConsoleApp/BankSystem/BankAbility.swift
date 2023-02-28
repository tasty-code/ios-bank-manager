//
//  BankAbility.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

enum BankAbility {
    
    enum CustomerConstant: UInt {
        case min = 10
        case max = 30
    }
    
    enum taskType {
        case deposit
        case loan
    }
    
    static var numberOfCustomer: UInt {
        guard let customerSum = (CustomerConstant.min.rawValue...CustomerConstant.max.rawValue).randomElement() else { return 0 }
        return customerSum
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
