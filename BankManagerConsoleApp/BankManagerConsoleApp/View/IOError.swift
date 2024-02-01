//
//  IOError.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 2/1/24.
//

import Foundation

enum IOError: LocalizedError {
    case invalidInput
    case unexpectedError
    
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "메뉴 번호를 보고 다시 입력해주세요."
        case .unexpectedError:
            return "앱을 다시 실행해주세요."
        }
    }
}
