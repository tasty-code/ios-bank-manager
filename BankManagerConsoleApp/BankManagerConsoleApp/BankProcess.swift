//
//  File.swift
//  BankManagerConsoleApp
//
//  Created by 김예준 on 11/7/23.
//

import Foundation

class BankProcess {
    private let bank: Bank
    
    init(bank: Bank) {
        self.bank = bank
    }
    
    func run() {
        while true {
            self.showMenuScript()
            
            guard let input = readLine(),
                  let userInput = Menu(rawValue: input)
            else {
                continue
            }
            
            switch userInput {
            case .open:
                self.bank.proceedBanking()
            case .exit:
                return
            case .wrongInput:
                print(Script.wrongInput)
            }
        }
    }
    
    private func showMenuScript() {
        print(Script.menu)
        print(Script.inputField, terminator: "")
    }
}

extension BankProcess {
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
