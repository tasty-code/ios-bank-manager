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
    private var numberOfCurrentCustomer = 0
    
    weak var delegate: UIUpdateDelegate?
    
    init() {
        var list = [ServiceType: BankServiceExecutor]()
        
        for serviceType in ServiceType.allCases {
            list[serviceType] = BankServiceExecutor(type: serviceType)
        }
        
        self.serviceList = list
    }
    
    func lineUpCustomers(amount: Int) {
        let offset = numberOfCurrentCustomer + 1
        for i in offset..<offset + amount {
            let customer = Customer(ticketNumber: i)
            waitingLine.enqueue(customer)
            delegate?.addCustomerLabel(customer)
        }
        
        numberOfCurrentCustomer += 10
    }
    
    func clearLine() {
        cancelAllWork()
        waitingLine.clear()
        numberOfCurrentCustomer = 0
        delegate?.resetAllCustomerLabel()
    }
    
    func runService() {
        DispatchQueue.global().async {
            while !self.waitingLine.isEmpty {
                guard let currentCustomer = self.waitingLine.dequeue(), let queue = self.serviceList[currentCustomer.serviceType] else { return }
                
                let taskBlock = BlockOperation {
                    self.delegate?.moveCustomerLabel(currentCustomer)
                    self.provideService(to: currentCustomer)
                    self.delegate?.removeCustomerLabel(currentCustomer)
                }
                
                queue.work(taskBlock)
            }
            
            self.didFinishAllWork()
        }
    }
    
    private func provideService(to target: Customer) {
        let serviceType = target.serviceType
        let durationTime: UInt32 = UInt32(serviceType.duration * 1_000_000)
        
        usleep(durationTime)
    }
    
    private func cancelAllWork() {
        serviceList.values.forEach { $0.cancel() }
    }
    
    private func didFinishAllWork() {
        serviceList.values.forEach {
            $0.notify {
                self.delegate?.stopTimer()
            }
        }
    }
}
