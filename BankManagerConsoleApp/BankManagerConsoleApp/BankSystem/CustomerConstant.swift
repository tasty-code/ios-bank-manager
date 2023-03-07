//
//  CustomerConstant.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/27.
//

import Foundation

enum CustomerConstant {
    
    static let min: UInt = 10
    static let max: UInt = 13
    
    static var numberOfCustomer: UInt {
        guard let customerSum = (CustomerConstant.min...CustomerConstant.max).randomElement() else { return 0 }
        return customerSum
    }
    
}

