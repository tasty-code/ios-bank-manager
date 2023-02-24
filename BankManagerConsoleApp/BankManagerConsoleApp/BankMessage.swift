//
//  BankMessage.swift
//  BankManagerConsoleApp
//
//  Created by 신동오 on 2023/02/24.
//

import Foundation

enum BankMessage {
    case startBanking
    case endBanking(customers: Int, takenTime: String)
}

extension BankMessage {
    func description() {
        switch self {
        case .startBanking:
            print("1 : 은행개점\n2 : 종료\n입력 : ", terminator: "")
        case .endBanking(let customers, let takenTime):
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(takenTime)초입니다.")
        }
    }
}
