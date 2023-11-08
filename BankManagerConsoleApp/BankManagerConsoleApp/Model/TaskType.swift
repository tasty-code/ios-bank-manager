//
//  TaskType.swift
//  BankManagerConsoleApp
//
//  Created by 동준 on 11/8/23.
//

import Foundation

enum TaskType: CustomStringConvertible, CaseIterable {
    case loan
    case deposit
    
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
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
