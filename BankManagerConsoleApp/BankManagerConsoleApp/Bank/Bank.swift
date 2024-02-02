//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

final class Bank {
    
    private let bankManager: BankManager
    private var customers: [Customer]? = nil
    private let startNumber: Int = 1
    private let userChoiceRange: ClosedRange<Int> = 1...2
    private let customerCountRange: ClosedRange<Int> = 10...30
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    func open() async {
        print(Message.default.showMessage())
        print(Message.userInput.showMessage(), terminator: "")
        let userInput = readLine()
        
        do {
            customers = try validateUserInput(with: userInput)
            await startTask()
        } catch {
            print(Message.inputError.showMessage())
            await open()
        }
    }
    
    private func validateUserInput(with userInput: String?) throws -> [Customer]? {
        guard let userInput,
              let userChoice = Int(userInput),
              userChoiceRange.contains(userChoice)
        else {
            throw BankError.inputError
        }

        guard userChoice == startNumber else { exit(1) }
        return MemberFactory.makeCustomers(count: Int.random(in: customerCountRange))
    }
            
    private func startTask() async {
        await alignCustomer()
        await handleTask()
        await open()
    }
    
    private func alignCustomer() async {
        guard let customers = customers else { return }
        for customer in customers {
            await bankManager.addCustomerQueue(with: customer)
        }
    }
    
    private func handleTask() async  {
        showProcessState()
        guard let customers = customers else { return }
        var total = 0.0
        for customer in customers {
            let totalDuration = await bankManager.performTotalTask(of: customer)
            let duration: Double = round(totalDuration * 100) / 100
            total += duration
        }
        print(Message.report(count: customers.count, duration: total).showMessage())
    }
    
    private func showProcessState() {
        bankManager.startTask = { num in
            print(Message.startTask(number: num).showMessage())
        }
        
        bankManager.finishTask = { num in
            print(Message.finishTask(number: num).showMessage())
        }
    }
}
