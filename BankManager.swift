//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager: UserInputReceivable {

    let bank = Bank()

    func execute() {
        SystemMenu.show()

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
