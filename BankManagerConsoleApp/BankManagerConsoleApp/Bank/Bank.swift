//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

final class Bank {
    
    private let bankManager: BankManager
    private var customers = [Customer]()
    private let startNumber: Int = 1
    private let userChoiceRange: ClosedRange<Int> = 1...2
    private let customerCountRange: ClosedRange<Int> = 10...30
    private var exitInput = false
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    func open() async {
        print(Message.default.text)
        print(Message.userInput.text, terminator: "")
        guard let userInput = readLine() else { return }
        
        do {
            try validateUserInput(with: userInput)
            customers = MemberFactory.makeCustomers(count: Int.random(in: customerCountRange))
            await startTask()
        } catch {
            print(Message.inputError.text)
            await open()
        }
    }
            
    private func validateUserInput(with userInput: String) throws {
        let userChoice = Int(userInput)
        switch userChoice {
        case 1:
            break
        case 2:
            exitInput = true
        default:
            throw BankError.inputError
        }
    }
            
    private func startTask() async {
        guard exitInput == false else { return }
        await alignCustomer(with: customers)
        await handleTask()
        await open()
    }
    
    private func alignCustomer(with customers: [Customer]) async {
        for customer in customers {
            await bankManager.addCustomerQueue(with: customer)
        }
    }
    
    private func handleTask() async  {
        showProcessState()
        await bankManager.performTotalTask()
        let duration: Double = round(bankManager.totalDuration * 100) / 100
        print(Message.report(count: customers.count, duration: duration).text)
    }
    
    private func showProcessState() {
        bankManager.startTask = { customer in
            print(Message.startTask(numer: customer.number, service: customer.service).text)
        }
        
        bankManager.finishTask = { customer in
            print(Message.finishTask(numer: customer.number, service: customer.service).text)
        }
    }
}
