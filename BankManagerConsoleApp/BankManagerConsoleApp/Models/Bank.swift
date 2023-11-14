//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Wonji Ha on 2023/11/07.
//

import Foundation

protocol BankDelegate: AnyObject {
    func work(bank: Bank, completion: @escaping () -> Void)
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
    
    func work(count: Int, completion: @escaping () -> Void) {
        gatherCustomers(count)
        
        tellers.forEach { teller in
            while customerQueue.isEmpty == false {
                guard let customer = customerQueue.dequeue() else { return }
                
                matchUpService(with: customer, on: teller)
            }
        }
        
        dispatchGroup.wait()
        completion() // 모든 고객 다 처리하면 타이머 끄기
    }
}

// MARK: Private Methods
extension Bank {
    private func gatherCustomers(_ count: Int) {
        let totalCustomersCount = count
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
