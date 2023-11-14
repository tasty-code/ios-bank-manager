//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/1/23.
//

import Foundation

final class Bank {
    private let serviceList: [ServiceType: BankServiceExecutor]
    private let waitingLine = Queue<Customer>()
    private var totalWorkTime: Double = 0
    private var exitCount: Int = 0
    private let semaphoreForExitCount = DispatchSemaphore(value: 1)
    
    init() {
        var list = [ServiceType: BankServiceExecutor]()
        
        for i in ServiceType.allCases {
            list[i] = BankServiceExecutor(type: i)
        }
        
        self.serviceList = list
    }
    
    func runService() {
        startService()
        shutDownService()
    }
    
    func lineUp(_ customer: Customer) {
        waitingLine.enqueue(customer)
    }
    
    func clearLine() {
        waitingLine.clear()
    }
    
    func processService() {
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue(), let queue = self.serviceList[currentCustomer.serviceType] else { return }
            
            let taskBlock = BlockOperation {
                self.provideService(to: currentCustomer)
            }

            queue.work(taskBlock)
        }
    }
}

private extension Bank {
    func startService() {
        let startTime = DispatchTime.now()

        processService()
        serviceList.values.forEach { $0.wait() }
        
        let endTime = DispatchTime.now()
        calculateTotalWorkTime(from: startTime, to: endTime)
    }
    
    func calculateTotalWorkTime(from startTime: DispatchTime,to endTime: DispatchTime) {
        let distance = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds

        let timeInterval = Double(distance) / 1_000_000_000
        totalWorkTime = timeInterval
    }
    
    func provideService(to target: Customer) {
        let serviceType = target.serviceType
        let durationTime: UInt32 = UInt32(serviceType.duration * 1_000_000)
        
        print(Prompt.serviceStart(customer: target.ticketNumber, service: serviceType.description))
        usleep(durationTime)
        print(Prompt.serviceDone(customer: target.ticketNumber, service: serviceType.description))
        
        semaphoreForExitCount.wait()
        exitCount += 1
        semaphoreForExitCount.signal()
    }
    
    func shutDownService() {
        print(Prompt.appFinish(totalCustomer: exitCount, totalWorkTime: totalWorkTime))
        prepareService()
    }
    
    func prepareService() {
        exitCount = 0
        totalWorkTime = 0
    }
}
