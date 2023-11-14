//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/1/23.
//

import Foundation

protocol UIUpdatable: AnyObject {
    func addLabel(_ target: Customer)
    func removeLabel(_ target: Customer)
}

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
    
    func lineUp(_ customer: Customer) {
        waitingLine.enqueue(customer)
    }
    
    func clearLine() {
        waitingLine.clear()
    }
    
    func startService(_ closure: @escaping () -> Void) {
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue(), let queue = self.serviceList[currentCustomer.serviceType] else { return }
            
            let taskBlock = BlockOperation {
                closure()
                self.provideService(to: currentCustomer)
            }

            queue.work(taskBlock)
        }
        
        serviceList.values.forEach { $0.wait() }
    }
}

private extension Bank {

    func provideService(to target: Customer) {
        let serviceType = target.serviceType
        let durationTime: UInt32 = UInt32(serviceType.duration * 1_000_000)
        
        usleep(durationTime)
        
        semaphoreForExitCount.wait()
        exitCount += 1
        semaphoreForExitCount.signal()
    }
    
    func shutDownService() {
        prepareService()
    }
    
    func prepareService() {
        exitCount = 0
        totalWorkTime = 0
    }
}
