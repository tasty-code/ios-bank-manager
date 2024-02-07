//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    var delegate: MainViewDelegate?
    private let banker: Banker = Banker()
    private(set) var isQueueRunning: Bool = false
    private var customerCountToStart: Int = 1
    private let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    
    private(set) var totalWaiting: [Customer] = [] {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.appendCustomerView(self.totalWaiting, isWaiting: true)
            }
        }
    }
    private(set) var totalProgress: [Customer] = [] {
        didSet { 
            DispatchQueue.main.async {
                self.delegate?.appendCustomerView(self.totalProgress, isWaiting: false)                
            }
        }
    }
    
    private var depositCustomerQueue: Queue<Customer> = Queue(linkedList: LinkedList(), semaphoreValue: 2)
    private var loanCustomerQueue: Queue<Customer> = Queue(linkedList: LinkedList(), semaphoreValue: 1)
    private let depositQueue: DispatchQueue = DispatchQueue(label: "예금업무큐")
    private let loanQueue: DispatchQueue = DispatchQueue(label: "대출업무큐")
    
    init() {
        depositCustomerQueue.delegate = self
        loanCustomerQueue.delegate = self
    }
}

extension BankManager {
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
                    self?.appendCustomerToProgress(customer)
                    self?.banker.provideService(to: customer)
                    self?.removeCustomerFromProgress(customer)
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
                    self?.appendCustomerToProgress(customer)
                    self?.banker.provideService(to: customer)
                    self?.removeCustomerFromProgress(customer)
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
        for i in customerCountToStart..<customerCountToStart + count {
            let randomService: BankingService = BankingService.allCases.randomElement() ?? .deposit
            switch randomService {
            case .deposit:
                depositCustomerQueue.enqueue(node: Node(value: Customer(waitingNumber: i, requiredService: randomService)))
            case .loan:
                loanCustomerQueue.enqueue(node: Node(value: Customer(waitingNumber: i, requiredService: randomService)))
            }
        }
        setWaitingCustomer()
        customerCountToStart += 10
    }
    
    func setWaitingCustomer() {
        var array: [Customer] = []
        for i in 0...depositCustomerQueue.count() {
            guard let customer = depositCustomerQueue.getNodeValue(at: i) else {
                continue
            }
            array.append(customer)
        }
        for i in 0...loanCustomerQueue.count() {
            guard let customer = loanCustomerQueue.getNodeValue(at: i) else {
                continue
            }
            array.append(customer)
        }
        array.sort { $0.waitingNumber < $1.waitingNumber }
        totalWaiting = array
    }
    
    func reset() {
        customerCountToStart = 0
        depositCustomerQueue.clear()
        loanCustomerQueue.clear()
//        depositQueue.cancelAllOperations()
//        loanQueue.cancelAllOperations()
    }
}

extension BankManager {
    private func toggleQueueStatus() {
        self.isQueueRunning.toggle()
    }
    
    private func appendCustomerToProgress(_ customer: Customer) {
        semaphore.wait()
        var array = totalProgress
        array.append(customer)
        array.sort { $0.waitingNumber < $1.waitingNumber }
        totalProgress = array
        semaphore.signal()
    }
    
    private func removeCustomerFromProgress(_ customer: Customer) {
        semaphore.wait()
        guard let index = totalProgress.firstIndex(of: customer) else {
            return
        }
        totalProgress.remove(at: index)
        semaphore.signal()
    }
}
