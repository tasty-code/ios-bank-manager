//
//  BankState.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/27.
//

import Foundation

enum BankState {
    
    case open
    case close(UInt, Double)
    case working(UInt, Bool)
    
}

extension BankState {
    
    var text: String {
        switch self {
        case .open:
            return BankTextCollection.consoleMenu
        case .close(let numberOfCustomer, let customerTime):
            return BankTextCollection.close(numberOfCustomer: numberOfCustomer, customerTime: customerTime)
        case .working(let order, let result):
            return BankTextCollection.working(order: order, inProgress: result)
        }
    }
    
}
