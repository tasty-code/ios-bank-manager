//
//  ConsoleMessagable.swift
//  BankManagerConsoleApp
//
//  Created by 박재우 on 2023/02/27.
//

import Foundation

protocol ConsoleMessagable {
    func printMessage(message: ConsoleMessage)
}

extension ConsoleMessagable {
    func printMessage(message: ConsoleMessage) {
        switch message {
        case .startBanking:
            print(message.description, terminator: "")
        default:
            print(message.description)
        }
    }
}
