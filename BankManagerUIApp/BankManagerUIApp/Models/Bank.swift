//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/1/23.
//

import Foundation

protocol UIUpdatable: AnyObject {
    func addLabelToWaitingStation(_ target: Customer)
    func removeLabelWhenFinished(_ target: Customer)
    func moveLabelToWorkStation(_ target: Customer)
    func stopTimerWhenAllWorkDone()
}

final class Bank {
    private let serviceList: [ServiceType: BankServiceExecutor]
    private let waitingLine = Queue<Customer>()
    private var numberOfCurrentCustomer: Int = 0
    
    weak var UIUpdater: UIUpdatable?
    
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
            UIUpdater?.addLabelToWaitingStation(customer)
        }
        
        numberOfCurrentCustomer += 10
    }
    
    func clearLine() {
        waitingLine.clear()
        numberOfCurrentCustomer = 0
    }

    func startService() {
        while !waitingLine.isEmpty {
            guard let currentCustomer = waitingLine.dequeue(), let queue = self.serviceList[currentCustomer.serviceType] else { return }
            
            let taskBlock = BlockOperation {
                DispatchQueue.main.async {
                    self.UIUpdater?.moveLabelToWorkStation(currentCustomer)
                }
                
                self.provideService(to: currentCustomer)
                DispatchQueue.main.async {
                    self.UIUpdater?.removeLabelWhenFinished(currentCustomer)
                }
            }

            queue.work(taskBlock)
            
        }
        
        guard let closure = UIUpdater?.stopTimerWhenAllWorkDone else { return }
        finishService(closure)
    }
    
    func provideService(to target: Customer) {
        let serviceType = target.serviceType
        let durationTime: UInt32 = UInt32(serviceType.duration * 1_000_000)
        
        usleep(durationTime)
    }
    
    func cancelService() {
        serviceList.values.forEach { $0.cancel() }
        clearLine()
    }
    
    func finishService(_ closure: @escaping () -> Void) {
        serviceList.values.forEach {
            $0.notify(closure)
        }
    }
}
