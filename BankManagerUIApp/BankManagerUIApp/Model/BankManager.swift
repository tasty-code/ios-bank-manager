//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    private(set) var isQueueRunning: Bool = false
    private(set) var totalCustomerInQueue: [Customer] = []
    private var lastCustomerNumber: Int = 0
    
    private let banker: Banker = Banker()
    private var depositCustomerQueue: Queue<Customer> = Queue(linkedList: LinkedList()) {
        didSet {
            totalCustomerInQueue = getTotalWaitingCustomer()
        }
    }
    private var loanCustomerQueue: Queue<Customer> = Queue(linkedList: LinkedList()) {
        didSet {
            totalCustomerInQueue = getTotalWaitingCustomer()
        }
    }
    private let depositQueue: OperationQueue = {
        let depositQueue = OperationQueue()
        depositQueue.maxConcurrentOperationCount = 2
        return depositQueue
    }()
    private let loanQueue: OperationQueue = {
        let loanQueue = OperationQueue()
        loanQueue.maxConcurrentOperationCount = 1
        return loanQueue
    }()
    
    func startBankingProcess() {
        isQueueRunning = true
        
        let depositCustomerBlock = BlockOperation { [weak self] in
            while !(self?.depositCustomerQueue.isEmpty() ?? false) {
                guard let node = self?.depositCustomerQueue.dequeue() else {
                    return
                }
                let customer = node.value
                let customerBlock = BlockOperation {
                    self?.banker.provideService(to: customer)
                }
                self?.depositQueue.addOperation(customerBlock)
                if let boolean = self?.depositQueue.isSuspended, boolean {
                    self?.depositQueue.waitUntilAllOperationsAreFinished()
                }
            }
        }
        
        let loanCustomerBlock = BlockOperation { [weak self] in
            while !(self?.loanCustomerQueue.isEmpty() ?? false) {
                guard let node = self?.loanCustomerQueue.dequeue() else {
                    return
                }
                let customer = node.value
                let customerBlock = BlockOperation {
                    self?.banker.provideService(to: customer)
                }
                self?.loanQueue.addOperation(customerBlock)
                self?.loanQueue.waitUntilAllOperationsAreFinished()
            }
        }
        
        let completionBlock = BlockOperation { [weak self] in
            self?.toggleQueueStatus()
        }
        completionBlock.addDependency(depositCustomerBlock)
        completionBlock.addDependency(loanCustomerBlock)
        
        OperationQueue().addOperations([depositCustomerBlock, loanCustomerBlock, completionBlock], waitUntilFinished: false)
    }
    
    func addCustomer(_ count: Int = 10) {
        for i in lastCustomerNumber...lastCustomerNumber + count {
            let randomService: BankingService = BankingService.allCases.randomElement() ?? .deposit
            switch randomService {
            case .deposit:
                depositCustomerQueue.enqueue(node: Node(value: Customer(waitingNumber: i, requiredService: randomService)))
            case .loan:
                loanCustomerQueue.enqueue(node: Node(value: Customer(waitingNumber: i, requiredService: randomService)))
            }
        }
        lastCustomerNumber += 10
    }
    
    private func toggleQueueStatus() {
        self.isQueueRunning.toggle()
    }
    
    func reset() {
        lastCustomerNumber = 0
        depositCustomerQueue.clear()
        loanCustomerQueue.clear()
        depositQueue.cancelAllOperations()
        loanQueue.cancelAllOperations()
    }
    
    func getTotalWaitingCustomerCount() -> Int {
        return depositCustomerQueue.count() + loanCustomerQueue.count()
    }
    
    private func getTotalWaitingCustomer() -> [Customer] {
        var array: [Customer] = []
        for i in 1...depositCustomerQueue.count() {
            guard let customer = depositCustomerQueue.getNodeValue(at: i) else {
                continue
            }
            array.append(customer)
        }
        for i in 1...loanCustomerQueue.count() {
            guard let customer = loanCustomerQueue.getNodeValue(at: i) else {
                continue
            }
            array.append(customer)
        }
        array.sort { $0.waitingNumber < $1.waitingNumber }
        return array
    }
}
