//
//  BankMessage.swift
//  BankManagerConsoleApp
//
//  Created by 루피, 진 on 1/30/24.
//

enum BankMessage: CustomStringConvertible {
    case bankMenu
    case start(Int, String)
    case done(Int , String)
    case result(Int, String)
    case request
    
    var description: String {
        switch self {
        case .bankMenu:
            return "1 : 은행 개점\n2 : 종료\n입력 : "
        case .request:
            return "잘못 입력 했습니다. 다시 입력 해주세요."
        case .start(let number, let task):
            return "\(number)번 고객 \(task)업무 시작"
        case .done(let number, let task):
            return "\(number)번 \(task)고객 업무 종료"
        case .result(let customerCount, let intervalTime):
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(intervalTime)입니다."
        }
    }
}
