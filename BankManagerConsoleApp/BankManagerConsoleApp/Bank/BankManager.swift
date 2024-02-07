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
    
    private let loanQueue = Queue<Customer>()
    private let depositQueue = Queue<Customer>()
}

// MARK: - Methods
extension BankManager {

    func addCustomerQueue(with customer: Customer) async {
        if customer.service == .loan {
            await loanQueue.enqueue(customer)
        } else {
            await depositQueue.enqueue(customer)
        }
    }

    func performTotalTask() async -> Double {
        let start = Date()
        async let loanTask: () = performLoan()
        async let depositTasks: () = performDeposit()
        async let depositTasks2: () = performDeposit()

        await loanTask
        await depositTasks
        await depositTasks2
        let endTime = Date()
        return endTime.timeIntervalSince(start)
    }

    private func performLoan() async {
        while let customer = await loanQueue.dequeue() {
            startTask?(customer)
            try? await Task.sleep(nanoseconds: UInt64(customer.service.requiredTime * 1_000_000_000))
            finishTask?(customer)
        }
    }

    private func performDeposit() async {
        while let customer = await depositQueue.dequeue() {
            startTask?(customer)
            try? await Task.sleep(nanoseconds: UInt64(customer.service.requiredTime * 1_000_000_000))
            finishTask?(customer)
        }
    }
}


