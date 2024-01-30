//
//  BankTaskType.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 1/30/24.
//

enum BankTaskType: CustomStringConvertible {
    case deposit
    case loan
    
    var description: String {
        switch self {
        case .deposit:
            return "예금업무"
        case .loan:
            return "대출업무"
        }
    }
    
    var duration: Double {
        switch self {
        case .deposit:
            return 1.1
        case .loan:
            return 0.7
        }
    }
}

extension BankTaskType: CaseIterable {
    static var random: Self? {
        return allCases.randomElement()
    }
}
