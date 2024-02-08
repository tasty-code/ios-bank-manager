//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 루피, 진 on 1/30/24.
//

protocol BankManagerProtocol {
    func sendWorkingMessage(_ message: String)
}

struct BankManager: BankManagerProtocol {
    
    var isRunning: Bool
    var bank: Bank
    let bankView: BankViewProtocol
     
    init(isRunning: Bool = true, bank: Bank = Bank(), bankView: BankViewProtocol = BankView()) {
        self.isRunning = isRunning
        self.bank = bank
        self.bankView = bankView
    }
    
    mutating func run() {
        while isRunning {
            bankView.printConsolView(message: BankMessage.bankMenu.description, terminator: "")
            
            switch fetchUserInput() {
            case "1":
                bank.open()
                break
            case "2":
                isRunning = false
                break
            default:
                bankView.printConsolView(message: BankMessage.request.description, terminator: nil)
                continue
            }
        }
    }
    
    private func fetchUserInput() -> String {
        guard let inputText = readLine() else { return Constants.userInputError }
        return inputText
    }
    
    func sendWorkingMessage(_ message: String) {
        bankView.printConsolView(message: message, terminator: nil)
    }
}
