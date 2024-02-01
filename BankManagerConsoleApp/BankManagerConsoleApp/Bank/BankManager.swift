//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private enum Menu: Int {
        case open = 1
        case close = 2
    }
    
    private var isRunning: Bool = true
    private var bank: Bank
    
    init(of bank: Bank) {
        self.bank = bank
    }

    mutating func run() {
        while isRunning {
            showMenu()
            guard let input = inputMenu(),
                  let value = Int(input),
                  let menu = Menu(rawValue: value)
            else {
                continue
            }
            
            switch menu {
            case .open:
                bank.open()
            case .close:
                isRunning = false
            }
        }
    }
    
    private func showMenu() {
        ConsoleView.showMenu()
    }
    
    private func inputMenu() -> String? {
        return Swift.readLine()
    }
}
