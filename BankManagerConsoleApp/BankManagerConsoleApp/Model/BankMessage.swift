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
            print(ConsoleMessage.startBanking, terminator: "")
        case .endBanking(let customers, let takenTime):
            print(ConsoleMessage.endBanking(customers: customers, takenTime: takenTime))
        }
    }
}
