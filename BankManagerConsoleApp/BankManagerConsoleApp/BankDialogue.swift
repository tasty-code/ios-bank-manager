//
//  BankDialogue.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/1/23.
//

import Foundation

enum BankDialogue: CustomStringConvertible {
    var description: String {
        switch self {
        case .menu:
            "1 : 은행개점\n2 : 종료"
        case .input:
            "입력 : "
        case .start(let customer):
            "\(customer) 업무 시작"
        case .finish(let customer):
            "\(customer) 업무 완료"
        case .close(let customerCount, let workTime):
            "업무가 마감되었습니다. 오늘 업무에 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(String(format: "%.2f", workTime))초 입니다."
        }
    }
    
    case menu
    case input
    case start(_ customer: Customer)
    case finish(_ customer: Customer)
    case close(_ customerCount: Int, workTime: Double)
}
