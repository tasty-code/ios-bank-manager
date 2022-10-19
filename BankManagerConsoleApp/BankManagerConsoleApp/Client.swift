//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 박도원 on 2022/10/17.
//

import Foundation

struct Client {
    func generateClientRandomNumber() -> Int {
        let startNumber: Int = 10
        let finishNumber: Int = 30
        let clientNumber = Int.random(in: startNumber...finishNumber)
        return clientNumber
    }
}
