//
//  BankingService.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/03/02.
//

import Foundation

enum BankingService: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"
    
    var timeSpent: Double {
        switch self {
        case .deposit: return 0.7
        case .loan: return 1.1
        }
    }
}

