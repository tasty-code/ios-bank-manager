//
//  BankController.swift
//  BankManagerConsoleApp
//
//  Created by Doyoung An on 1/30/24.
//

final class BankController {
    private let bank: Bank<LinkedListQueue<Customer>>
    
    init(bank: Bank<LinkedListQueue<Customer>>) {
        self.bank = bank
    }
    
    /// 사용자 입력
    func runBankApp() {
        var userChoice: String?
        consoleMessage.bankMenu()
        
        repeat {
            if let choice = readLine() {
                userChoice = choice
                
                switch userChoice {
                case "1":
                    bank.open {
                        consoleMessage.bankMenu()
                    }
                case "2":
                    consoleMessage.appExitMessage()
                default:
                    consoleMessage.inputErrorMessage()
                    consoleMessage.bankMenu()
                }
            }
        } while userChoice != "2"
    }
}
