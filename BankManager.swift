//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager: Receivable {

    func startBusiness() {
        print(Message.menu)
        print(Message.inputLabel, terminator: "")

        guard let userInput = getUserInput() else { return }

        switch SystemMenu(rawValue: userInput) {
        case .open:
            break
        case .close:
            break
        case .none:
            break
        }
    }

    func makeRandomNumber() -> Int { Int.random(in: (10...30)) }
}
