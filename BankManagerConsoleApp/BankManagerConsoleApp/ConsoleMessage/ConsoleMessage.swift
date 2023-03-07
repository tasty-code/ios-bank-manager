//
//  ConsoleMessage.swift
//  BankManagerConsoleApp
//
//  Created by 박재우 on 2023/02/24.
//

import Foundation

enum ConsoleMessage {
    case startBanking
    case endBanking(clients: Int, takenTime: Double)
    case invalidCommandError
    case startAssist(_ client: Int, type: BankingType)
    case endAssist(_ client: Int, type: BankingType)
}

extension ConsoleMessage {
    var description: String {
        switch self {
        case .startBanking:
            return "1 : 은행개점\n2 : 종료\n입력 : "
        case .endBanking(let clients, let takenTime):
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clients)명이며, 총 업무시간은 \(takenTime)초입니다."
        case .invalidCommandError:
            return "선택이 잘못되었습니다. 확인 후 다시 입력해주세요."
        case .startAssist(let client, let type):
            return "\(client)번 고객 \(type.description)업무 시작"
        case .endAssist(let client, let type):
            return "\(client)번 고객 \(type.description)업무 완료"
        }
    }
}
