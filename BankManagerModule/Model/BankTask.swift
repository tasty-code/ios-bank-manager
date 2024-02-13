//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 1/30/24.
//

enum BankTask {
    case deposit
    case loan
    
    var duration: Double {
        switch self {
        case .deposit: return 0.7
        case .loan: return 1.1
        }
    }
    
    var name: String {
        switch self {
        case .deposit: return "예금"
        case .loan: return "대출"
        }
    }
}

extension BankTask: CaseIterable {
    static var random: Self? {
        return allCases.randomElement()
    }
}
