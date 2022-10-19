//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by Schro on 2022/10/19.
//

import Foundation

enum WorkType {
    case loan
    case deposit
    
    var time: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}
