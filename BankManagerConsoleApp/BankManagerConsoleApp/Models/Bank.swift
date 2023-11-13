//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Wonji Ha on 2023/11/07.
//

import Foundation

protocol BankDelegate: AnyObject {
    func someFunction(bank: Bank, timer: TimeInterval)
}

final class Bank {
    private let customerQueue = Queue<Customer>()
    private let dispatchGroup = DispatchGroup()
    private let tellers: [TellerProtocol]
    private var servicedCustomersCount = 0
    private var totalServicedTimes: TimeInterval = 0.0
    private weak var bankManager: BankDelegate?
    
    init(tellers: [TellerProtocol], _ bankManager: BankDelegate) {
        self.tellers = tellers
        self.bankManager = bankManager
    }
    
    func work(completion: @escaping () -> Void) {
        gatherCustomers()
        
        tellers.forEach { teller in
            while customerQueue.isEmpty == false {
                guard let customer = customerQueue.dequeue() else { return }
                
                matchUpService(with: customer, on: teller)
            }
        }
        
        dispatchGroup.wait()
        completion()
    }
}

// MARK: Private Methods
extension Bank {
    private func gatherCustomers() {
        let totalCustomersCount = Int.random(in: 10...30)
        for count in 1...totalCustomersCount {
            guard let randomWorkType = WorkType.allCases.randomElement() else { return }
            let customer = Customer(id: count, workType: randomWorkType)
            customerQueue.enqueue(customer)
        }
    }
    
    private func matchUpService(with customer: Customer, on teller: TellerProtocol) {
        DispatchQueue.global().async(group: dispatchGroup) {
            teller.service(to: customer) { [self] in
                servicedCustomersCount += 1
                totalServicedTimes += customer.workType.timeCost
            }
        }
    }
}
