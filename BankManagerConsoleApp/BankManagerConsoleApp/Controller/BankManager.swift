//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 김동준 on 1/30/24.
//

import Foundation

struct BankManager {
    var isRunning: Bool = true
    var bank = Bank()
    
    mutating func run() {
        while isRunning {
            print(BankMessage.bankMenu.description, terminator: "")
            
            switch fetchUserInput() {
            case "1":
                bank.open()
                break
            case "2":
                isRunning = false
                break
            default:
                print(BankMessage.request.description)
                continue
            }
        }
    }
    
    func fetchUserInput() -> String {
        guard let inputText = readLine() else { return Constants.userInputError }
        return inputText
    }
}
