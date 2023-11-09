//
//  Service.swift
//  BankManagerConsoleApp
//
//  Created by Janine on 11/6/23.
//

import Foundation

enum ServiceType: CaseIterable {
    case loan
    case deposit
    
    var duration: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }

    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
    
    var maxCount: Int {
        switch self {
        case .loan:
            return 1
        case .deposit:
            return 2
        }
    }
}
