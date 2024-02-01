//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let currentBank = Bank(clerk: BankClerk())
var bankManger = BankManager(of: currentBank)
bankManger.run()

