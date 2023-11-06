//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by Wonji Ha on 2023/11/02.
//

import Foundation

enum WorkType: CustomStringConvertible, CaseIterable {
    case deposit
    case loan
    
    static var random: WorkType {
        guard let radomType = WorkType.allCases.randomElement() else {
            fatalError("WorkType is empty")
        }
        return radomType
    }
    
    var description: String {
        switch self {
        case .deposit:
            "예금"
        case .loan:
            "대출"
        }
    }
    
    var costTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
