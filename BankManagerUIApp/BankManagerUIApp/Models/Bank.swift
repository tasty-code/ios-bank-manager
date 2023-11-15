//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/1/23.
//

import Foundation

protocol UIUpdatable: AnyObject {
    func addLabel(_ target: Customer)
    func removeFinishedLabel(_ target: Customer)
    func moveLabelToWorkStation(_ target: Customer)
    func checkQueueEnded()
}

final class Bank {
    private let serviceList: [ServiceType: BankServiceExecutor]
    private let waitingLine = Queue<Customer>()
    private var numberOfCompleteQueue: Int = 0
    private var numberOfCurrentCustomer: Int = 0
    
    weak var uiUpdaterDelegate: UIUpdatable?
    
    init() {
        var list = [ServiceType: BankServiceExecutor]()
        
        for i in ServiceType.allCases {
            list[i] = BankServiceExecutor(type: i)
        }
        
        self.serviceList = list
    }
    
    func lineUp() {
        let offset = numberOfCurrentCustomer + 1
        for i in offset..<offset + 10 {
            let customer = Customer(ticketNumber: i)
            waitingLine.enqueue(customer)
            uiUpdaterDelegate?.addLabel(customer)
        }
        
        numberOfCurrentCustomer += 10
    }
    
    func clearLine() {
        waitingLine.clear()
        numberOfCurrentCustomer = 0
        numberOfCompleteQueue = 0
    }
    
    func provideService(to target: Customer) {
        let serviceType = target.serviceType
        let durationTime: UInt32 = UInt32(serviceType.duration * 1_000_000)
        
        usleep(durationTime)
    }

    func startService(_ completion: @escaping () -> Void) {
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue(), let queue = self.serviceList[currentCustomer.serviceType] else { return }
            
            let taskBlock = BlockOperation {
                DispatchQueue.main.sync {
                    self.uiUpdaterDelegate?.moveLabelToWorkStation(currentCustomer)
                }
                
                self.provideService(to: currentCustomer)
                DispatchQueue.main.sync {
                    self.uiUpdaterDelegate?.removeFinishedLabel(currentCustomer)
                }
            }

            queue.work(taskBlock)
        }
        
        guard let closure = uiUpdaterDelegate?.checkQueueEnded else { return }
        finishService(closure)
    }
    
    func finishService(_ closure: @escaping () -> Void) {
        serviceList.values.forEach {
            $0.notify(closure)
        }
    }
    
    func cancelService() {
        serviceList.values.forEach { $0.cancel() }
        clearLine()
    }
}
