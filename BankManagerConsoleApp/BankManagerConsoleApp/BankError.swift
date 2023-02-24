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
            return "선택이 잘못되었습니다. 확인 후 다시 입력해주세요."
        }
    }
}
