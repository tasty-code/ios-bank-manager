//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김예준 on 11/2/23.
//

import Foundation

struct Bank {
    private let bankManager: BankManager

    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    func proceedBanking() {
        let clientCount = Int.random(in: 10...30)
        
        self.beginReception(count: clientCount)
        self.bankManager.startWork()
    }
    
    private func beginReception(count: Int) {
        for i in 1...count {
            let client = Client(id: i, spendTime: 0.7)
            self.bankManager.recept(for: client)
        }
    }
}
