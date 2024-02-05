//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/25.
//

import Foundation

final class BankManager {
    var startTask: ((Customer) -> Void)?
    var finishTask: ((Customer) -> Void)?
    
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
            async let _ = await performDeposit()
            async let _ = await performDeposit()
        }
        
        let endTime = Date()
        let duration = endTime.timeIntervalSince(startTime)

        return duration
    }

    private func performLoanTask() async {
        if let customer = await customerQueue.dequeue() {
            startTask?(customer)
            try? await Task.sleep(nanoseconds: UInt64(customer.service.requiredTime * 1_000_000_000))
            finishTask?(customer)
        }
    }

    private func performDeposit() async {
        if let customer = await customerQueue.dequeue() {
            startTask?(customer)
            Thread.sleep(forTimeInterval: customer.service.requiredTime)
            finishTask?(customer)
        }
    }
}


