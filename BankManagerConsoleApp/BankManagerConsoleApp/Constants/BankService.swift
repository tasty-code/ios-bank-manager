//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/02/07.
//

import Foundation

enum BankService: String, CaseIterable {

    case loan = "대출"
    case deposit = "예금"
    
    var description: String {
        return self.rawValue
    }
    
    var requiredTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}
