//
//  TaskType.swift
//  BankManagerConsoleApp
//
//  Created by 김수경 on 2023/11/06.
//

import Foundation

enum TaskType: CustomStringConvertible, CaseIterable {
    case deposit
    case loan
    
    var taskTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
