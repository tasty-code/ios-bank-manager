//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 박찬호 on 1/30/24.
//

import Foundation

final class Bank<Q: QueueProtocol> where Q.Element == Customer {
    private var customerQueue: Q
    private let consoleMessage: ConsoleMessage
    private var totalCustomers: Int = 0
    
    init(customerQueue: Q, consoleMessage: ConsoleMessage) {
        self.customerQueue = customerQueue
        self.consoleMessage = consoleMessage
    }
    
    /// 고객 업무 시작
    func open() {
        let numberOfCustomers = Int.random(in: 10...30)
        for number in 1...numberOfCustomers {
            customerQueue.enqueue(Customer(waitingNumber: number))
        }
        totalCustomers = numberOfCustomers
        processCustomer()
    }
    
    /// 고객 업무 완료
    func processCustomer() {
        while let customer = customerQueue.dequeue() {
            consoleMessage.taskStartMessage(customerNumber: customer.waitingNumber)
            Thread.sleep(forTimeInterval: 0.7)
            consoleMessage.teskEndMessage(customerNumber: customer.waitingNumber)
        }
        closed()
    }
    
    /// 업무가 마감됨
    func closed() {
        let totalTime = Double(totalCustomers) * 0.7
        consoleMessage.bankClosingMessage(totalCustomers: totalCustomers, time: totalTime)
    }
}
