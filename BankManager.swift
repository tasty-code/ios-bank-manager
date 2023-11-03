//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func menu() {
        print(Prompt.menu, terminator: "")
        guard let input = readLine() else { return }
        switch input {
        case "1":
            run()
        case "2":
            break
        default:
            print(Prompt.wrongInput)
            menu()
        }
    }
    
    private func run() {
        let bank = Bank(numOfTellers: 1)
        bank.visitClient()
        bank.open()
        self.input()
    }
}
