//
//  BankWorkType.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 2/2/24.
//

enum BankWorkType: CaseIterable {
    case loan
    case deposit
}

extension BankWorkType {
    var name: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
    
    var time: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}
