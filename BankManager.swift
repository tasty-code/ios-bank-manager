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
    
    var bank: Bank = Bank()
    private var isRunning: Bool = true

    mutating func run() {
        while isRunning {
            showMenu()
            guard let input = inputMenu(),
                  let value = Int(input),
                  let menu = Menu(rawValue: value)
            else {
                return
            }
            processMenu(menu)
        }
    }
    
    private mutating func processMenu(_ inputProcess: Menu) {
        switch inputProcess {
        case .open:
            bank.executeBankWork()
            break
        case .close:
            isRunning = bank.closeBank()
            break
        }
    }
    
    private func showMenu() {
        showPromt(message: workMessage.open)
        showPromt(message: workMessage.exit)
    }
    
    private func inputMenu() -> String? {
        return Swift.readLine()
    }
    
    private func showPromt(message: workMessage) {
        print(message.show)
    }
}

