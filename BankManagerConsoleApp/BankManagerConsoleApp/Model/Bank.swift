//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/27.
//

import Foundation

struct Bank: Manageable {
    
    let banker = Banker()

    func open() {
        let processingTimePerPerson = Banker.processingTime
        let numberOfTodayCustomers = makeAcceptableNumber()
        let customerQueue = makeCustomerQueue(maxCount: numberOfTodayCustomers)

        while !customerQueue.isEmpty() {
            let currentCustomer = customerQueue.dequeue()
            guard let numberOfCurrentCustomer = currentCustomer?.waitingOrder else { return }

            banker.work(for: numberOfCurrentCustomer)
        }

        print(Message.bankClose(numberOfTodayCustomers, processingTimePerPerson))
    }
}
