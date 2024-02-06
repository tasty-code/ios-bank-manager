//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by dopamint on 1/31/24.
//

import Foundation

final class Bank {
    private let depositBankerCount: Int
    private let loanBankerCount: Int
    private var totalDepositWorkingTime: Double
    private var totalLoanWorkingTime: Double
    
    private var depositBankerQueue = Queue<Banker>()
    private var loanBankerQueue = Queue<Banker>()
    private var depositCustomerQueue = Queue<Customer>()
    private var loanCustomerQueue = Queue<Customer>()
    private let group = DispatchGroup()
    
    init(depositBankerCount: Int, loanBankerCount: Int) {
        self.depositBankerCount = depositBankerCount
        self.loanBankerCount = loanBankerCount
        self.totalDepositWorkingTime = 0.0
        self.totalLoanWorkingTime = 0.0
    }
    
    func open() {
        Messages.openBank.printMessage()
        let numberOfCustomers = Int.random(in: 10...30)

        print("고객 수: \(numberOfCustomers)")
        setUpBankerQueue(depositBankerCount: depositBankerCount, loanBankerCount: loanBankerCount)
        setUpCustomerQueue(count: numberOfCustomers)
        
        while !depositCustomerQueue.isEmpty() || !loanCustomerQueue.isEmpty() {
            serveCustomer(bankerQueue: depositBankerQueue, customerQueue: depositCustomerQueue)
            serveCustomer(bankerQueue: loanBankerQueue, customerQueue: loanCustomerQueue)
        }
        group.wait()
        
        let formattedTotalWorkingTime = max(totalLoanWorkingTime, totalDepositWorkingTime).formattedDecimal
        Messages.closeBank(customerCount: numberOfCustomers, totalTime: formattedTotalWorkingTime).printMessage()
        depositBankerQueue.clear()
        loanBankerQueue.clear()
    }
    
    private func setUpBankerQueue(depositBankerCount: Int, loanBankerCount: Int) {
        for _ in 1...depositBankerCount {
            depositBankerQueue.enqueue(Banker(taskType: .deposit))
        }
        for _ in 1...loanBankerCount {
            loanBankerQueue.enqueue(Banker(taskType: .loan))
        }
    }
    
    private func setUpCustomerQueue(count: Int) {
        for number in 1...count {
            guard let customer = Customer(number: number) else { return }
            if customer.taskType == .deposit {
                depositCustomerQueue.enqueue(customer)
            } else if customer.taskType == .loan {
                loanCustomerQueue.enqueue(customer)
            }
        }
    }
    
    private func processTask(banker: Banker, customer: Customer, bankerQueue: Queue<Banker>) {
        DispatchQueue.global().async(group: group)  { [self] in
            totalDepositWorkingTime += banker.processCustomer(customer)
            bankerQueue.enqueue(Banker(taskType: banker.taskType))
        }
    }
    
    private func serveCustomer(bankerQueue: Queue<Banker>, customerQueue: Queue<Customer>) {
        if bankerQueue.isEmpty() == false {
            guard let customer = customerQueue.dequeue(),
                  let banker = bankerQueue.dequeue()
            else { return }
            processTask(banker: banker, customer: customer, bankerQueue: bankerQueue)
        }
    }
}



