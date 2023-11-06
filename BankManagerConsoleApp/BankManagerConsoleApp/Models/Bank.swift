//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/1/23.
//

import Foundation

final class Bank {
    private var totalTime: Double = 0
    private var entranceCount: Int = 0
    private var exitCount: Int = 0
    private let waitingLine = Queue<Customer>()
    
    func open(with numberOfCustomer: Int) {
        entranceCount = numberOfCustomer
        lineUpCustomer()
        startService()
    }
    
    private func lineUpCustomer() {
        for i in 1...entranceCount {
            waitingLine.enqueue(Customer(ticketNumber: i))
        }
    }
    
    private func clear() {
        entranceCount = 0
    }
    
    private func startService() {
        let queue = DispatchQueue(label: "worker")
        let group = DispatchGroup()
        
        while !waitingLine.isEmpty {
            guard let frontCustomer = waitingLine.dequeue() else { break }
            
            queue.async(group: group) { [weak self] in
                self?.provideService(to: frontCustomer)
            }
        }
        
        group.wait()
        close()
    }
    
    private func close() {
        print(Prompt.appFinish(totalCustomer: exitCount, totalTime: totalTime))
        clear()
    }
    
    private func provideService(to target: Customer) {
        print(Prompt.serviceStart(customer: target.ticketNumber, service: ""))
        usleep(700_000)
        print(Prompt.serviceDone(customer: target.ticketNumber, service: ""))
        totalTime += 0.7
        exitCount += 1
    }
}










