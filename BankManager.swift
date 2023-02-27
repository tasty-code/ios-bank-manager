//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager: Receivable {

    let bank = Bank()

    func execute() {
        print(Message.menu)
        print(Message.inputLabel, terminator: "")

        guard let userInput = getUserInput() else { return }

        switch SystemMenu(rawValue: userInput) {
        case .open:
            bank.open()
            return execute()
        case .close:
            break
        case .none:
            break
        }
    }
}
