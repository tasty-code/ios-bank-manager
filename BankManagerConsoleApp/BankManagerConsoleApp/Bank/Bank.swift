//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by dopamint on 1/31/24.
//

import Foundation

final class Bank {

    private var banker = Banker()
    private var customerQueue = Queue<Customer>()
    private let depositSemaphore: DispatchSemaphore
    private let loanSemaphore: DispatchSemaphore
    private let group = DispatchGroup()
    
    init(depositBankerCount: Int, loanBankerCount: Int) {
        self.depositSemaphore = DispatchSemaphore(value: depositBankerCount)
        self.loanSemaphore = DispatchSemaphore(value: loanBankerCount)
    }
    
    func open() {
        let startTime = Date()
        Messages.openBank.printMessage()
        let numberOfCustomers = Int.random(in: 10...30)
        
        print("고객 수: \(numberOfCustomers)")
        setUpCustomerQueue(count: numberOfCustomers)
        
        while let customer = customerQueue.dequeue() {
            switch customer.taskType {
            case .deposit:
                serveCustomer(semaphore: depositSemaphore, customer: customer)
            case .loan:
                serveCustomer(semaphore: loanSemaphore, customer: customer)
            }
        }
        group.wait()
        let endTime = Date()
        let elapsedTime = endTime.timeIntervalSince(startTime).formattedDecimal
        Messages.closeBank(customerCount: numberOfCustomers, totalTime: elapsedTime).printMessage()
    }
    
    private func serveCustomer(semaphore: DispatchSemaphore, customer: Customer) {
        DispatchQueue.global().async(group: group) {
            semaphore.wait()
            self.banker.processCustomer(customer)
            semaphore.signal()
        }
    }
    
    private func setUpCustomerQueue(count: Int) {
        for number in 1...count {
            let customer = Customer(number: number)
            customerQueue.enqueue(customer)
        }
    }
}



