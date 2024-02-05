//
//  BankMessage.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

import Foundation

enum BankMessage {
    case open
    case exit
    case start(Int, String)
    case done(Int, String)
    case result(Int, String)
    
    var show: String {
        switch self {
        case .open:
            return "1 : 은행 개점"
        case .exit:
            return "2 : 종료"
        case .start(let number, let workType):
            return "\(number)번 고객 \(workType)업무 시작"
        case .done(let number, let workType):
            return "\(number)번 고객 \(workType)업무 완료"
        case .result(let customerCount, let intervalTime):
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(intervalTime)입니다."
        }
    }
}
