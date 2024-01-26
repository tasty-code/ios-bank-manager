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
    private let startNumber: Int = 1
    private let customerCountRange: ClosedRange<Int> = 10...30
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    func openBank() {
        print(Message.default.showMessage())
        print(Message.userInput.showMessage(), terminator: "")
        
        let userInput = readLine()
        
        do {
            customerCount = try validateUserInput(with: userInput)
            startTask()
        } catch {
            print(Message.inputError.showMessage())
            openBank()
        }
    }
    
    private func validateUserInput(with userInput: String?) throws -> Int? {
        guard let userInput,
              let userChoice = Int(userInput),
              userChoice > 0 && userChoice < 3
        else {
            throw BankError.inputError
        }
        
        return userChoice == startNumber ? Int.random(in: customerCountRange) : nil
    }
    
    private func showProcessState() {
        bankManager.updateTaskState = { result in
            switch result {
            case .start(let num):
                print(Message.startTask(number: num).showMessage())
            case .finish(let num):
                print(Message.finishTask(number: num).showMessage())
            }
        }
    }
    
    private func startTask() {
        guard let customerCount = customerCount else { return }
        bankManager.makeCustomerQueue(with: customerCount)
        showProcessState()
        bankManager.handleTask { totalDuration in
            let duration: Double = round(totalDuration * 100) / 100
            print(Message.report(count: customerCount, duration: duration).showMessage())
        }
        openBank()
    }
}
