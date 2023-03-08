//
//  InputError.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/27.
//

import Foundation

enum InputError: LocalizedError {
    case invalidInput

    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "입력이 잘못되었습니다."
        }
    }
}
