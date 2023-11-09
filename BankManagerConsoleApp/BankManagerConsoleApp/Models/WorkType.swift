//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by Wonji Ha on 2023/11/02.
//

import Foundation

enum WorkType: CustomStringConvertible, CaseIterable {
    case deposit, loan
    
    var description: String {
        switch self {
        case .deposit: "예금"
        case .loan: "대출"
        }
    }
    
    var timeCost: TimeInterval {
        switch self {
        case .deposit: 0.7
        case .loan: 1.1
        }
    }
}
