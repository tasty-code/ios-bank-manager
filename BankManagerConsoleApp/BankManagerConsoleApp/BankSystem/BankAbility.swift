//
//  BankAbility.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

enum BankAbility {
    
    enum CustomerAmount {
        
        static let min: UInt = 10
        static let max: UInt  = 30
        
        static var numberOfCustomer: UInt {
            guard let customerSum = (CustomerAmount.min...CustomerAmount.max).randomElement() else { return 0 }
            return customerSum
        }
        
    }
    
    static var taskDuration: Double = 0.7
    
}
