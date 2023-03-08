//
//  BankingType.swift
//  BankManagerConsoleApp
//
//  Created by 박재우 on 2023/03/06.
//

import Foundation

enum BankingType: CaseIterable {
    case loan
    case deposit
}

extension BankingType {
    static var random: BankingType {
        guard let type = BankingType.allCases.randomElement() else {
            fatalError("BankingType is empty")
        }
        return type
    }
    
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
}
