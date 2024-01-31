//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let console = ConsoleManager()
let bankManager = BankManager(textOut: console)

let totalClientNumber = 30

let number = (10...20).randomElement()!

let orders = [
    Order(taskType: Loan.self, bankerCount: 2, clientCount: number),
    Order(taskType: Deposit.self, bankerCount: 3, clientCount: totalClientNumber - number),
]

bankManager.runBank(with: orders)
