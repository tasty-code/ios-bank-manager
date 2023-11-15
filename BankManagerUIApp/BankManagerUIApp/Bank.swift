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
    private(set) var handledCustomer = 1
    
    weak var delegate: BankUIDelegate?
    
    init(customerQueue: Queue<Customer>, handledCustomer: Int = 1) {
        self.customerQueue = customerQueue
        self.handledCustomer = handledCustomer
    }
    
    func beginTask(completionHandler: @escaping () -> Void) {
        DispatchQueue.global(qos: .userInitiated).async { [self] in
            addRandomCustomers(handledCustomer, taskTypes: LoanTask.self, DepositTask.self)
            
            while !customerQueue.isEmpty {
                if let customer = customerQueue.dequeue() {
                    DispatchQueue.main.async(group: group) {
                        let label = CustomerLabel(customer: customer)
                        self.delegate?.handleWaitingCustomer(customerLabel: label)
                        self.assignTask(label)
                    }
                }
            }
            
            handledCustomer += 10
            group.notify(queue: .main) {
                completionHandler()
            }
        }
    }
    
    func assignTask(_ customer: CustomerLabel) {
        let task = customer.customer.task
        let semaphore = type(of: task).semaphore
        let queue = type(of: task).dispatchQueue
        
        queue.async(group: group) {
            semaphore.wait()
            if !customer.customer.workable {
                semaphore.signal()
                return
            }
            DispatchQueue.main.async {
                self.delegate?.handleProcessingCustomer(customerLabel: customer)
            }
            Thread.sleep(forTimeInterval: task.processingTime)
            DispatchQueue.main.async {
                self.delegate?.handleProcessedCustomer(customerLabel: customer)
            }
            semaphore.signal()
        }
    }
    
    func resetCustomer() {
        handledCustomer = 1
    }
    
    private func addRandomCustomers(_ count: Int, taskTypes: BankTask.Type...) {
        for i in count..<count + 10 {
            if let randomTask = taskTypes.randomElement() {
                customerQueue.enqueue(Customer(id: i, task: randomTask.init()))
            }
        }
    }
}
