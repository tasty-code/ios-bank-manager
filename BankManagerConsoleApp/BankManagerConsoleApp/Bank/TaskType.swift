//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by dopamint on 2/1/24.
//
enum TaskType: CaseIterable, CustomStringConvertible {
    case loan
    case deposit
}

extension TaskType {
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    
    }
    
    var taskTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }

}
