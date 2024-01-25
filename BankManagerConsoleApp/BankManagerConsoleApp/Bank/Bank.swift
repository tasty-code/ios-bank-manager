//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

final class Bank {
    
    private let bankManager: BankManager
    private var customerCount: Int?
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    func open() {
        print(Message.default.showMessage())
        print(Message.userInput.showMessage(), terminator: "")
        
        guard let userInput = readLine(),
              let userChoice = Int(userInput)
        else {
            open()
            return
        }
        validateUserInput(with: userChoice)
    }
    
    private func validateUserInput(with userChoice: Int) {
        if userChoice == 1 {
            customerCount = Int.random(in: 10...30)
        }
        
        if let _ = customerCount {
            startTask()
        }
    }
    
    private func handle() {
        bankManager.updateCustomerNumber = { result in
            switch result {
            case .start(let num):
                print(Message.startTask(number: num).showMessage())
            case .finish(let num):
                print(Message.finishTask(number: num).showMessage())
            }
        }
    }
    
    private func startTask() {
        guard let customerCount = customerCount else {
            return
        }
        
        handle()
        
        bankManager.handleTask(with: customerCount) { [weak self] totalDuration in
            let duration: Double = round(totalDuration * 100) / 100
            print(Message.report(count: customerCount, duration: duration).showMessage())
            self?.customerCount = nil
            self?.open()
        }
    }
}
