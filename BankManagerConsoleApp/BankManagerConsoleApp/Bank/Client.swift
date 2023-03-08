//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 박재우 on 2023/03/06.
//

import Foundation

struct Client {
    let type: BankingType
    let waitingNumber: Int

    init(waitingNumber: Int) {
        self.type = BankingType.random
        self.waitingNumber = waitingNumber
    }
}
