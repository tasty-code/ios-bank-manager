//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/31/24.
//

enum BankTask {
    case deposit
    case loan
    
    var name: String {
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
            return 0.7
        case .loan:
            return 1.1
        }
    }
}

extension BankTask: CaseIterable {
    static var allCasesSet: Set<Self> {
        return Set(allCases)
    }
}
