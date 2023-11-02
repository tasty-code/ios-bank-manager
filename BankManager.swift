//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func input() {
        print(Prompt.menu, terminator: "")
        guard let input = readLine() else { return }
        switch input {
        case "1":
            run()
        case "2":
            break
        default:
            print(Prompt.wrongInput)
            self.input()
        }
    }
    
    private func run() {
        let bank = Bank(numOfTellers: 1)
        bank.makeClientQueue()
        bank.open()
        self.input()
    }
}
