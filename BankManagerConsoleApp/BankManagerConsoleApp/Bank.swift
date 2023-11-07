//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김준성 on 11/1/23.
//

import Foundation

class Bank: Bankable {
    let group: DispatchGroup = DispatchGroup()
    private(set) var customerQueue: Queue<Customer>
    private(set) var handledCustomer = 0
    
    init(customerQueue: Queue<Customer>) {
        self.customerQueue = customerQueue
    }
    
    func beginTask() -> (taskProcessingTime: Double, handledCustomer: Int) {
        handledCustomer = 0
        addRandomCustomers(Int.random(in: 10...30), taskTypes: LoanTask.self, DepositTask.self)
        
        let start = CFAbsoluteTimeGetCurrent()
        while !customerQueue.isEmpty {
            if let customer = customerQueue.dequeue() {
                assignTask(customer, group: group)
                handledCustomer += 1
            }
        }
        
        group.wait()
        
        let end = CFAbsoluteTimeGetCurrent() - start
        
        return (Double(end), handledCustomer)
    }
    
    private func addRandomCustomers(_ count: Int, taskTypes: BankTask.Type...) {
        for i in 1...count {
            customerQueue.enqueue(Customer(id: i, task: taskTypes.randomElement()!.init()))
        }
    }
}
