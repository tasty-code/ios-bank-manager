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
            self.showMenuScript()
            
            guard let input = readLine(),
                  let userInput = Menu(rawValue: input)
            else {
                continue
            }
            
            switch userInput {
            case .open:
                self.proceedBanking()
            case .exit:
                return
            case .wrongInput:
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

extension Bank {
    private enum Menu: String {
        case open
        case exit
        case wrongInput
        
        init?(rawValue: String) {
            switch rawValue {
            case "1":
                self = .open
            case "2":
                self = .exit
            default:
                self = .wrongInput
            }
        }
    }
}
