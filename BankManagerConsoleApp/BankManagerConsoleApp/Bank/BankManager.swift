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
        let startTime = Date()
        switch customer.service {
        case .loan:
            await performLoanTask()
        case .deposit:
            async let _ = performDeposit()
            async let _ = performDeposit()
        }
        
        let endTime = Date()
        let duration = endTime.timeIntervalSince(startTime)

        return duration
    }

    private func performLoanTask() async {
        if let customer = await customerQueue.dequeue() {
            startTask?(customer.number)
            Thread.sleep(forTimeInterval: 0.7)
            finishTask?(customer.number)
        }
    }

    private func performDeposit() async {
        if let customer = await customerQueue.dequeue() {
            startTask?(customer.number)
            Thread.sleep(forTimeInterval: 1.1)
            finishTask?(customer.number)
        }
    }
}


