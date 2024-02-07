//
//  BankTask.swift
//  BankManagerUIApp
//
//  Created by ㅣ on 2/7/24.
//

import Foundation

enum BankTask: String, CaseIterable {
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
