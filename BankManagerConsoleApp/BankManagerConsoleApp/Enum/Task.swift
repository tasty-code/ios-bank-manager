//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by MAC2020 on 2/2/24.
//

import Foundation

enum Task: CustomStringConvertible, CaseIterable {
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
    
    case loan
    case deposit
}
