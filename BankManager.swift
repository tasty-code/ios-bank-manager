//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private let queue: Queue<Customer>
    
    init(queue: Queue<Customer>) {
        self.queue = queue
    }
    
    func run() {
        do {
            printMenuMessage()
            let input = try inputMenu()
            switchMenu(input)
        } catch let error {
            print(error)
            run()
        }
    }
}

// MARK: Private Methods
extension BankManager {
    private func printMenuMessage() {
        print(InterfaceMessage.menuMessage)
        print(InterfaceMessage.inputMenu, terminator: "")
    }
    
    private func printBankEndMessage(_ totalCustomerCount: Int, totalSeconds: Double) {
        print(InterfaceMessage.bankDidClose(totalCustomerCount: totalCustomerCount, totalSeconds: totalSeconds))
    }
    
    private func printStartWorkMessage(_ customerId: Int) {
        print(InterfaceMessage.startWork(customerId: customerId))
    }
    
    private func printCompleteWorkMessage(_ customerId: Int) {
        print(InterfaceMessage.completeWork(customerId: customerId))
    }
    
    private func inputMenu() throws -> String {
        guard let input = readLine(), input == "1" || input == "2" else { throw InterfaceErrorMessage.wrongMenuSelected }
        return input
    }
    
    private func switchMenu(_ input: String) {
        switch input {
        case "1":
            let totalCustomerCount = waitForCustomer()
            let totalSeconds = work()
            printBankEndMessage(totalCustomerCount, totalSeconds: totalSeconds)
            run()
        default: return
        }
    }
    
    private func waitForCustomer() -> Int {
        let customerCount: Int = generateRandomNumber10To30()
        
        for count in 1..<customerCount {
            let customer = Customer(id: count)
            queue.enqueue(customer)
        }
        return customerCount
    }
    
    private func work() -> Double {
        var totalSeconds: Double = 0
        while queue.isEmpty == false {
            
            guard let customer = self.queue.dequeue() else { return totalSeconds }
            
            DispatchQueue.global().sync {
                self.printStartWorkMessage(customer.id)
                Thread.sleep(forTimeInterval: 0.7)
                self.printCompleteWorkMessage(customer.id)
                totalSeconds += 0.7
            }
        }
        return totalSeconds
    }
    
    private func generateRandomNumber10To30() -> Int {
        return Int.random(in: 10...30)
    }
}
