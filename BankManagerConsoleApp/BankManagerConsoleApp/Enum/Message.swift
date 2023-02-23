//
//  Message.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/23.
//

import Foundation

enum Message: CustomStringConvertible {

    case menu
    case inputLabel

    var description: String {
        switch self {
        case .menu:
            let open = SystemMenu.open
            let close = SystemMenu.close

            return "\(open.rawValue) : \(open)\n\(close.rawValue) : \(close)"
        case .inputLabel:
            return "입력 : "
        }
    }

    static func workStart(_ orderNumber: Int) -> String { "\(orderNumber)번 고객 업무 시작" }

    static func workComplete(_ orderNumber: Int) -> String { "\(orderNumber)번 고객 업무 완료" }

    static func bankClose(_ totalNumber: Int) -> String {
        let processingTimePerPerson = Banker.processingTime
        let totalTime = Double(totalNumber) * processingTimePerPerson

        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumber)명이며, 총 업무시간은 \(totalTime)초입니다." }
}

