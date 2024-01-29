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
    case start(Int)
    case done(Int)
    
    var show: String {
        switch self {
        case .open:
            return "1 : 은행 개점"
        case .exit:
            return "2 : 종료"
        case .start(let number):
            return "\(number)번 고객 업무 시작"
        case .done(let number):
            return "\(number)번 고객 업무 완료"
        }
    }
}
