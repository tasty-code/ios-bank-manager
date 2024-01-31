//
//  CustomerManager.swift
//  BankManagerConsoleApp
//
//  Created by Matthew on 1/31/24.
//

import Foundation

struct CustomerManager {
    
    private let customerWaitingList: Queue = Queue<Customer>()
    private let customerCount: Int = Int.random(in: 10...30)
}

extension CustomerManager {
    
    func enqueueCustomer(CustomerNumberTicket: Customer) {
        customerWaitingList.enqueue(data: CustomerNumberTicket)
    }
    
    func dequeueCustomer() {
        customerWaitingList.dequeue()
    }
    
    func fetchCustomerWaitingList() -> Queue<Customer> {
        return customerWaitingList
    }
    
    func fetchCustomerCount() -> Int {
        return customerCount
    }
}
