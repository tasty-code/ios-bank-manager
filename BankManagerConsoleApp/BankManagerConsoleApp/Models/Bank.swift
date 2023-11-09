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
    private var totalTime: Double = 0
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
}

private extension Bank {
    func startService() {
        let group = DispatchGroup()
        
        let start = DispatchTime.now()
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue() else { break }
            
            DispatchQueue.global().async(group: group) { [weak self] in
                guard let self = self, let worker = self.serviceList[currentCustomer.serviceType] else { return }
                worker.work {
                    self.provideService(to: currentCustomer)
                }
            }
        }

        group.wait()
        
        let end = DispatchTime.now()
        checkExecutedTime(start: start, end: end)
    }
    
    func checkExecutedTime(start: DispatchTime, end: DispatchTime) {
        let distance = end.uptimeNanoseconds - start.uptimeNanoseconds

        let timeInterval = Double(distance) / 1_000_000_000
        totalTime = timeInterval
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
        print(Prompt.appFinish(totalCustomer: exitCount, totalTime: totalTime))
        prepareService()
    }
    
    func prepareService() {
        exitCount = 0
        totalTime = 0
    }
}
