//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let currentBank = Bank(loanClerksCount: 1, depositClerksCount: 2)
var bankManger = BankManager(of: currentBank)
bankManger.run()

