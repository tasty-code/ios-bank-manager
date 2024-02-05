//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by dopamint on 1/31/24.
//

import Foundation

final class Bank {
    
    let depositBankerCount: Int
    let loanBankerCount: Int
    var totalDepositWorkingTime: Double = 0
    var totalLoanWorkingTime: Double = 0
    
    var depositBankerQueue = Queue<Banker>()
    var loanBankerQueue = Queue<Banker>()
    var depositCustomerQueue = Queue<Customer>()
    var loanCustomerQueue = Queue<Customer>()
    
    init(depositBankerCount: Int, loanBankerCount: Int) {
        self.depositBankerCount = depositBankerCount
        self.loanBankerCount = loanBankerCount
    }
    
    func open() {
        Messages.openBank.printMessage()
        let numberOfCustomers = Int.random(in: 10...30)

        print("고객 수: \(numberOfCustomers)")
        
        for _ in 1...depositBankerCount {
            depositBankerQueue.enqueue(Banker(taskType: .deposit))
        }
        for _ in 1...loanBankerCount {
            loanBankerQueue.enqueue(Banker(taskType: .loan))
        }
        
        for number in 1...numberOfCustomers {
            guard let customer = Customer(number: number) else { return }
            if customer.taskType == .deposit {
                depositCustomerQueue.enqueue(customer)
            } else if customer.taskType == .loan {
                loanCustomerQueue.enqueue(customer)
            }
        }
        processCustomers()
        
        let formattedTotalWorkingTime = max(totalLoanWorkingTime, totalDepositWorkingTime).formattedDecimal
        Messages.closeBank(customerCount: numberOfCustomers, totalTime: formattedTotalWorkingTime).printMessage()
        
    }
    
    private func processCustomers() {
        while !depositCustomerQueue.isEmpty() || !loanCustomerQueue.isEmpty() {
            
            DispatchQueue.global().async { [self] in
                if depositBankerQueue.isEmpty() == false {
                    
                    guard let banker = depositCustomerQueue.dequeue(), let workingTime = depositBankerQueue.dequeue()?.processCustomer(banker)
                    else { return }
                    totalDepositWorkingTime += workingTime
                    depositBankerQueue.enqueue(Banker(taskType: .deposit))
                }
            }
            
            DispatchQueue.global().async { [self] in
                if loanBankerQueue.isEmpty() == false {
                    
                    guard let banker = loanCustomerQueue.dequeue(), let workingTime = loanBankerQueue.dequeue()?.processCustomer(banker)
                    else { return }
                    loanBankerQueue.enqueue(Banker(taskType: .loan))
                    totalLoanWorkingTime += workingTime
                }
            }
        }
    }
}

