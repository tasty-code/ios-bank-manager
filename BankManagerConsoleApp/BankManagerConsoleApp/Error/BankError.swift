//
//  BankError.swift
//  BankManagerConsoleApp
//
//  Created by 신동오 on 2023/02/24.
//

import Foundation

enum BankError {
    case invalidCommand
}

extension BankError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidCommand:
            return ConsoleMessage.invalidCommandError.description
        }
    }
}
