//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager: BankManagerDelegate {
    private enum Menu: Int {
        case open = 1
        case close = 2
    }
    
    private var isRunning: Bool = true
    private var bank: Bank
    
    init(of bank: Bank) {
        self.bank = bank
        self.bank.delegate = self
    }

    func run() {
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
    
    func showResult(customerCount: Int, intervalTime: String) {
        ConsoleView.showResult(customerCount: customerCount, intervalTime: intervalTime)
    }

    func showCustomerWorkStart(customerNumber: Int, workType: String) {
        ConsoleView.showCustomerWorkStart(customerNumber: customerNumber, workType: workType)
    }

    func showCustomerWorkDone(customerNumber: Int, workType: String) {
        ConsoleView.showCustomerWorkDone(customerNumber: customerNumber, workType: workType)
    }
}
