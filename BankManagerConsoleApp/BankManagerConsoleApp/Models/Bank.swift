//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Wonji Ha on 2023/11/07.
//

import Foundation

final class Bank {
    private let customerQueue = Queue<Customer>()
    private let dispatchGroup = DispatchGroup()
    private let semaphore = DispatchSemaphore(value: 1)
    private var tellers: [Teller]
    private var servicedCustomersCount = 0
    private var totalServicedTimes: TimeInterval = 0.0
    
    init(tellers: [Teller]) {
        self.tellers = tellers
    }
    
    func work(completion: @escaping () -> Void) {
        gatherCustomers()
        
        tellers.forEach { teller in
            DispatchQueue.global().async(group: dispatchGroup) { [self] in
                while customerQueue.isEmpty == false {
                    semaphore.wait()
                    guard let customer = customerQueue.peek(), customer.workType == teller.workType else {
                        semaphore.signal()
                        continue
                    }
                    
                    guard let customer = customerQueue.dequeue() else { return }
                    
                    semaphore.signal()
                    
                    teller.service(to: customer) { [self] in
                        servicedCustomersCount += 1
                        totalServicedTimes += customer.workType.timeCost
                    }
                }
            }
        }
        
        dispatchGroup.wait()
        InterfaceMessage.printBankDidClose(servicedCustomersCount: servicedCustomersCount, totalServicedTimes: totalServicedTimes)
        completion()
    }
}

// MARK: Private Methods
extension Bank {
    private func gatherCustomers() {
        let totalCustomersCount = Int.random(in: 10...30)
        for count in 1...totalCustomersCount {
            let customer = Customer(id: count)
            customerQueue.enqueue(customer)
        }
    }
}
