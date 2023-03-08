//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/03/07.
//

import Foundation

enum WorkType: String, CaseIterable {
    case loan = "대출"
    case deposit = "예금"

    var timespent: TimeInterval {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}
