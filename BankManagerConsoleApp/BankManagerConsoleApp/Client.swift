//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 박도원 on 2022/10/17.
//

import Foundation

struct Client {
    func randomClientNumber() -> Int {
        let clientNumber = Int.random(in: 10...30)
        return clientNumber
    }
}
