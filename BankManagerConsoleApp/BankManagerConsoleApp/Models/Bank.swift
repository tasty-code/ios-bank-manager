//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Wonji Ha on 2023/11/07.
//

import Foundation

protocol BankDelegate: AnyObject {
    func gatherCustomers(bank: Bank, from startCount: Int, to endCount: Int)
    func updateWaitingCustomersList(bank: Bank, customer: Customer)
    func updateWorkingCustomersList(bank: Bank, customer: Customer)
    func updateViewWhenCustomerDidMatched(bank: Bank, customer: Customer)
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
    
    func work(completion: @escaping (Bool) -> Void) {
        tellers.forEach { teller in
            while customerQueue.isEmpty == false {
                guard let customer = customerQueue.dequeue() else { return }
                
                matchUpService(with: customer, on: teller)
                
                DispatchQueue.main.async { [self] in
                    bankManager?.updateViewWhenCustomerDidMatched(bank: self, customer: customer)
                    print("넘어감")
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) { [self] in
            completion(customerQueue.isEmpty)
        }
    }
}

// MARK: Private Methods
extension Bank {
    func gatherCustomers(from: Int, to: Int) {
        for count in from...to {
            guard let randomWorkType = WorkType.allCases.randomElement() else { continue }
            let customer = Customer(id: count, workType: randomWorkType)
            customerQueue.enqueue(customer)
            
            DispatchQueue.main.async { [self] in
                bankManager?.updateWaitingCustomersList(bank: self, customer: customer)
                print("대기자 목록에 추가 \(customer.id)")
            }
        }
    }
    
    private func matchUpService(with customer: Customer, on teller: TellerProtocol) {
        DispatchQueue.global().async(group: dispatchGroup, qos: .background) {
            teller.service(to: customer) { [self] in
                servicedCustomersCount += 1
                totalServicedTimes += customer.workType.timeCost
                
                DispatchQueue.main.async { [self] in
                    bankManager?.updateWorkingCustomersList(bank: self, customer: customer)
                }
            }
        }
    }
}
