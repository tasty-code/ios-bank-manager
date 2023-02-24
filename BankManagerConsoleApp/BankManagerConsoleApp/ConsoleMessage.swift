//
//  ConsoleMessage.swift
//  BankManagerConsoleApp
//
//  Created by 박재우 on 2023/02/24.
//

import Foundation

enum ConsoleMessage {
    static let startBanking = "1 : 은행개점\n2 : 종료\n입력 : "
    static func endBanking(customers: Int, takenTime: String) -> String {
        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(takenTime)초입니다."
    }
    static let invalidCommandError = "선택이 잘못되었습니다. 확인 후 다시 입력해주세요."
    static func startAssist(_ client: Int) -> String {
        return "\(client)번 고객 업무 시작"
    }
    static func endAssist(_ client: Int) -> String {
        return "\(client)번 고객 업무 완료"
    }
    static let managerExcutionTime: UInt32 = 700000
}
