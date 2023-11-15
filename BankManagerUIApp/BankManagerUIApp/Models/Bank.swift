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
    private var isSame: Int = 0
    
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
    
    func startService(_ forUI: @escaping (_ target: Customer) -> Void, _ forTimer: @escaping () -> Void) {
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue(), let queue = self.serviceList[currentCustomer.serviceType] else { return }
            
            let taskBlock = BlockOperation {
                forUI(currentCustomer)
                self.provideService(to: currentCustomer)
            }

            queue.work(taskBlock)
        }
        
        finishService(forTimer)
    }
    
    func finishService(_ closure: @escaping () -> Void) {
        serviceList.values.forEach {
            $0.notify {
                self.isSame += 1
                
                if self.isSame % 2 == 0 {
                    closure()
                }
            }
        }
    }
    
    func cancelService() {
        serviceList.values.forEach { $0.cancel() }
    }
    
    func provideService(to target: Customer) {
        let serviceType = target.serviceType
        let durationTime: UInt32 = UInt32(serviceType.duration * 1_000_000)
        
        usleep(durationTime)
    }
}
