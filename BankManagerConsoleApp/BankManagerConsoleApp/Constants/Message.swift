//
//  Message.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

enum Message {
    case `default`
    case userInput
    case inputError
    case startTask(number: Int)
    case finishTask(number: Int)
    case report(count: Int, duration: Double)
}

extension Message {
    
    func showMessage() -> String {
        switch self {
        case .default:
            return """
            1 : 은행개점
            2 : 종료
            """
        case .userInput:
            return "입력 : "
        case .inputError:
            return "잘못된 입력입니다. 다시 입력해주세요."
        case .startTask(let number):
            return "\(number)번 고객 업무 시작"
        case .finishTask(let number):
            return "\(number)번 고객 업무 완료"
        case .report(let count, let duration):
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(count)명이며, 총 업무시간은 \(String(format: "%.2f", duration))초입니다."
        }
    }
}
