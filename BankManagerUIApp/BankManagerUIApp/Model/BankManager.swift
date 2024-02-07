//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    private(set) var isQueueRunning: Bool = false
    private(set) var totalCustomerInQueue: [Customer] = []
    private var customerCountToStart: Int = 1
    private let banker: Banker = Banker()

    private var depositCustomerQueue: Queue<Customer> = Queue(linkedList: LinkedList(), semaphoreValue: 2) {
        didSet {
            totalCustomerInQueue = getTotalWaitingCustomer()
        }
    }
    private var loanCustomerQueue: Queue<Customer> = Queue(linkedList: LinkedList(), semaphoreValue: 1) {
        didSet {
            totalCustomerInQueue = getTotalWaitingCustomer()
        }
    }
    private let depositQueue: DispatchQueue = DispatchQueue(label: "예금업무큐")
    private let loanQueue: DispatchQueue = DispatchQueue(label: "대출업무큐")
    
    func startBankingProcess() {
        isQueueRunning = true
        
        let depositTask = DispatchWorkItem { [weak self] in
            let semaphore = self?.depositCustomerQueue.semaphore
            while !(self?.depositCustomerQueue.isEmpty() ?? false) {
                semaphore?.wait()
                guard let node = self?.depositCustomerQueue.dequeue() else {
                    return
                }
                let customer = node.value
                let task = DispatchWorkItem {
                    self?.banker.provideService(to: customer)
                    semaphore?.signal()
                }
                self?.depositQueue.async(execute: task)
            }
        }
        
        let loanTask = DispatchWorkItem { [weak self] in
            let semaphore = self?.loanCustomerQueue.semaphore
            while !(self?.loanCustomerQueue.isEmpty() ?? false) {
                semaphore?.wait()
                guard let node = self?.loanCustomerQueue.dequeue() else {
                    return
                }
                let customer = node.value
                let task = DispatchWorkItem {
                    self?.banker.provideService(to: customer)
                    semaphore?.signal()
                }
                self?.loanQueue.async(execute: task)
            }
        }
        
        let completionBlock = DispatchWorkItem { [weak self] in
            self?.toggleQueueStatus()
        }
        
        let group: DispatchGroup = DispatchGroup()
        
        DispatchQueue.global().async(group: group, execute: depositTask)
        DispatchQueue.global().async(group: group, execute: loanTask)
        
        group.notify(queue: .main, work: completionBlock)
    }
    
    func addCustomer(_ count: Int = 10) {
        for i in customerCountToStart...customerCountToStart + count {
            let randomService: BankingService = BankingService.allCases.randomElement() ?? .deposit
            switch randomService {
            case .deposit:
                depositCustomerQueue.enqueue(node: Node(value: Customer(waitingNumber: i, requiredService: randomService)))
            case .loan:
                loanCustomerQueue.enqueue(node: Node(value: Customer(waitingNumber: i, requiredService: randomService)))
            }
        }
        customerCountToStart += 10
    }
    
    private func toggleQueueStatus() {
        self.isQueueRunning.toggle()
    }
    
    func reset() {
        customerCountToStart = 0
        depositCustomerQueue.clear()
        loanCustomerQueue.clear()
//        depositQueue.cancelAllOperations()
//        loanQueue.cancelAllOperations()
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
