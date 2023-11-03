//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김예준 on 11/2/23.
//

import Foundation

struct Bank {
    private let bankManager: BankManager
    
    init(clerkCount: Int) {
        self.bankManager = BankManager(clerkCount)
    }
    
    func open() {
        while true {
            showMenuScript()
            
            guard let input = readLine() else { return }
            switch input {
            case "1":
                proceedBanking()
            case "2":
                return
            default:
                print(Script.wrongInput)
            }
        }
    }
    
    private func proceedBanking() {
        let clientCount = Int.random(in: 10...30)
        
        self.beginReception(count: clientCount)
        self.bankManager.startWork()
        self.showBankSettlement(count: clientCount)
    }
    
    private func showMenuScript() {
        print(Script.menu)
        print(Script.inputField, terminator: "")
    }
    
    private func beginReception(count: Int) {
        for i in 1...count {
            self.bankManager.recept(client: Client(id: i, spendTime: 0.7))
        }
    }
    
    private func showBankSettlement(count: Int) {
        print(Script.bankSettlementMessage(count: count, totalWorkTime: self.bankManager.totalWorkTime))
    }
}
