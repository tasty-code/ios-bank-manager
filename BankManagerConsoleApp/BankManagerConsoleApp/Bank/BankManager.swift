//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

final class BankManager {
    var startTask: ((Int) -> Void)?
    var finishTask: ((Int) -> Void)?
    
    private var customerQueue = Queue<Customer>()
}

// MARK: - Methods
extension BankManager {

    func addCustomerQueue(with customer: Customer) async {
        await customerQueue.enqueue(customer)
    }

    func performTotalTask(of customer: Customer) async -> Double {
        var totalDuration = 0.0
        
        switch customer.service {
        case .loan:
            totalDuration += await performLoanTask()
        case .deposit:
            
            async let depositDuration1 = performDeposit()
            async let depositDuration2 = performDeposit()
            
            totalDuration += await depositDuration1
            totalDuration += await depositDuration2
        }
        return totalDuration
    }

    private func performLoanTask() async -> Double {
        if let customer = await customerQueue.dequeue() {
            let startTime = Date()
            startTask?(customer.number)
            Thread.sleep(forTimeInterval: 0.7)
            finishTask?(customer.number)
            let endTime = Date()
            let duration = endTime.timeIntervalSince(startTime)
            return duration
        }
        return 0.0
    }

    private func performDeposit() async -> Double {
        if let customer = await customerQueue.dequeue() {
            let startTime = Date()
            startTask?(customer.number)
            Thread.sleep(forTimeInterval: 1.1)
            finishTask?(customer.number)
            let endTime = Date()
            let duration = endTime.timeIntervalSince(startTime)
            return duration
        }
        return 0.0
    }

}


