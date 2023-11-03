//
//  Script.swift
//  BankManagerConsoleApp
//
//  Created by 김예준 on 11/3/23.
//

import Foundation
enum Script: CustomStringConvertible {
    case menu
    case inputField
    case wrongInput
    case bankSettlementMessage(count: Int, totalWorkTime: String)
    
    var description: String {
        switch self {
        case .menu:
            return "1 : 은행개점\n2 : 종료"
        case .inputField:
            return "입력 : "
        case .wrongInput:
            return "잘 못된 입력입니다."
        case .bankSettlementMessage(let clientCount, let totalWorkTime):
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(totalWorkTime) 입니다."
        }
    }
    
    enum WorkState: CustomStringConvertible  {
        case start(client: Client)
        case end(client: Client)
        
        var description: String {
            switch self {
            case .start(let client):
                return "\(client) 업무 시작"
            case .end(let client):
                return "\(client) 업무 완료"
            }
        }
    }
}
