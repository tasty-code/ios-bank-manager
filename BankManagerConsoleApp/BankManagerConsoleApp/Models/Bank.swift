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
        exitCount = 0
        totalTime = 0
    }
    
    private func startService() {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 3
         
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue() else { break }
            
            let taskBlock = BlockOperation {
                self.provideService(to: currentCustomer)
            }
            queue.addOperation(taskBlock)
        }
        queue.waitUntilAllOperationsAreFinished()
        
        close()
    }
    
    private func close() {
        print(Prompt.appFinish(totalCustomer: exitCount, totalTime: totalTime))
        clear()
    }
    
    private func provideService(to target: Customer) {
        let serviceType = target.serviceType
        let durationTime: UInt32 = UInt32(serviceType.duration) * 1_000_000
        
        print(Prompt.serviceStart(customer: target.ticketNumber, service: serviceType.description))
        usleep(durationTime)
        print(Prompt.serviceDone(customer: target.ticketNumber, service: serviceType.description))
        
        totalTime += serviceType.duration
        exitCount += 1
    }
}










