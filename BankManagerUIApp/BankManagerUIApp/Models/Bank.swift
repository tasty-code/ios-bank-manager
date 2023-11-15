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
    
    func lineUp(_ customer: Customer) {
        waitingLine.enqueue(customer)
    }
    
    func clearLine() {
        waitingLine.clear()
    }
    
    func startService(_ closure: @escaping (_ target: Customer) -> Void) {
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue(), let queue = self.serviceList[currentCustomer.serviceType] else { return }
            
            let taskBlock = BlockOperation {
                closure(currentCustomer)
                self.provideService(to: currentCustomer)
            }

            queue.work(taskBlock)
        }
        
        
    }
    
    func finishService(_ closure: @escaping () -> Void) {
        serviceList.values.forEach { $0.notify(closure)}
    }
    
    func cancelService() {
        serviceList.values.forEach { $0.cancel() }
    }
}

private extension Bank {
    func provideService(to target: Customer) {
        let serviceType = target.serviceType
        let durationTime: UInt32 = UInt32(serviceType.duration * 1_000_000)
        
        usleep(durationTime)
        print("\(target.ticketNumber) DONE")
    }
    
    func shutDownService() {
        prepareService()
    }
    
    func prepareService() {
        exitCount = 0
        totalWorkTime = 0
    }
}
