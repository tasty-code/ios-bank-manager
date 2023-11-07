//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/1/23.
//

import Foundation

final class Bank {
    private var totalTime: Double = 0
    private var exitCount: Int = 0
    private let waitingLine = Queue<Customer>()
    
    func runService() {
        startService()
        shutDownService()
    }
    
    func lineUp(_ customer: Customer) {
        waitingLine.enqueue(customer)
    }
}

private extension Bank {
    func startService() {
        let loanQueue: OperationQueue = OperationQueue(name: "LoanQueue", maxConcurrentOperationCount: 1)
        let depositQueue: OperationQueue = OperationQueue(name: "DepositQueue", maxConcurrentOperationCount: 2)
        
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue() else { break }
            
            let taskBlock = BlockOperation {
                self.provideService(to: currentCustomer)
            }
            
            if currentCustomer.serviceType == .deposit {
                depositQueue.addOperation(taskBlock)
            } else {
                loanQueue.addOperation(taskBlock)
            }
        }
        
        OperationQueue.waitUntilAllOperationsAreFinished(depositQueue, loanQueue)
    }
    
    func provideService(to target: Customer) {
        let serviceType = target.serviceType
        let durationTime: UInt32 = UInt32(serviceType.duration * 1_000_000)
        
        print(Prompt.serviceStart(customer: target.ticketNumber, service: serviceType.description))
        usleep(durationTime)
        print(Prompt.serviceDone(customer: target.ticketNumber, service: serviceType.description))
        
        totalTime += serviceType.duration
        exitCount += 1
    }
    
    func shutDownService() {
        print(Prompt.appFinish(totalCustomer: exitCount, totalTime: totalTime))
        prepareService()
    }
    
    func prepareService() {
        exitCount = 0
        totalTime = 0
    }
}
