//
//  BankAbility.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

enum BankAbility {
    
    enum CustomerAmount: UInt {
        
        case min = 10
        case max = 30
        
        static var numberOfCustomer: UInt {
            guard let customerSum = (CustomerAmount.min.rawValue...CustomerAmount.max.rawValue).randomElement() else { return 0 }
            return customerSum
        }
        
    }
    
    static var taskDuration: Double = 0.7
    
}
