//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func menu() {
        print(Prompt.menu, terminator: "")
        guard let input = readLine() else { return }
        switch input {
        case "1":
            run()
        case "2":
            break
        default:
            print(Prompt.wrongInput)
            menu()
        }
    }
    
    private func run() {
        let bank = Bank(depositTeller: 2, loanTeller: 1)
        
        let number = Int.random(in: 10...30)
//        bank.visit(numberOfClient: number)
        
        let time = measureTime {
//            bank.open()
        }
        bank.close(numberOfClient: number, at: time)
        
        menu()
    }
    
    private func measureTime(_ closure: () -> ()) -> TimeInterval {
        let startDate = Date()
        closure()
        return Date().timeIntervalSince(startDate)
    }
}
