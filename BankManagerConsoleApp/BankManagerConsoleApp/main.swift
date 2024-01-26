//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

let clientDispatcher = ClientManager()

let bankers = [
    "에피",
    "카일",
    "디오",
].map { name in Banker.init(name: name, dispatcher: clientDispatcher) }

let bank = BankManager(bankers: bankers, clientDispatcher: clientDispatcher)
bank.start()
