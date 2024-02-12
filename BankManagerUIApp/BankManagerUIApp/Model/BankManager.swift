//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    var delegate: MainViewController?
    private let banker: Banker = Banker()
    private(set) var isDepositQueueRunning: Bool = false
    private(set) var isLoanQueueRunning: Bool = false
    private var customerCountToStart: Int = 1
    private let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    
    private(set) var totalWaiting: [Customer] = [] {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.showCustomerView(self.totalWaiting, isWaiting: true)
            }
        }
    }
    private(set) var totalProgress: [Customer] = [] {
        didSet { 
            DispatchQueue.main.async {
                self.delegate?.showCustomerView(self.totalProgress, isWaiting: false)
            }
        }
    }
    
    private var depositCustomerQueue: Queue<Customer> = Queue(linkedList: LinkedList())
    private var loanCustomerQueue: Queue<Customer> = Queue(linkedList: LinkedList())
    private let depositQueue: DispatchQueue = DispatchQueue(label: "예금업무큐", attributes: .concurrent)
    private let loanQueue: DispatchQueue = DispatchQueue(label: "대출업무큐")
    
    init() {
        depositCustomerQueue.delegate = self
        loanCustomerQueue.delegate = self
    }
}

extension BankManager {
    func startBankingProcess(completion: @escaping () -> Void) {
        let group: DispatchGroup = DispatchGroup()
        
        let depositTask = DispatchWorkItem { [weak self] in
            self?.isDepositQueueRunning = true
            let depositSemaphore = DispatchSemaphore(value: 2)
            guard let isEmpty = self?.depositCustomerQueue.isEmpty() else {
                return
            }
            while !isEmpty {
                depositSemaphore.wait()
                guard let node = self?.depositCustomerQueue.dequeue() else {
                    depositSemaphore.signal()
                    return
                }
                let customer = node.value
                let task = DispatchWorkItem {
                    self?.appendCustomerToProgress(customer)
                    self?.banker.provideService(to: customer)
                    self?.removeCustomerFromProgress(customer)
                    depositSemaphore.signal()
                }
                self?.depositQueue.async(execute: task)
            }
            self?.isDepositQueueRunning = false
        }
        
        let loanTask = DispatchWorkItem { [weak self] in
            self?.isLoanQueueRunning = true
            let loanSemaphore = DispatchSemaphore(value: 1)
            guard let isEmpty = self?.loanCustomerQueue.isEmpty() else {
                return
            }
            while !isEmpty {
                loanSemaphore.wait()
                guard let node = self?.loanCustomerQueue.dequeue() else {
                    loanSemaphore.signal()
                    return
                }
                let customer = node.value
                let task = DispatchWorkItem {
                    self?.appendCustomerToProgress(customer)
                    self?.banker.provideService(to: customer)
                    self?.removeCustomerFromProgress(customer)
                    loanSemaphore.signal()
                }
                self?.loanQueue.async(execute: task)
            }
            self?.isLoanQueueRunning = false
            DispatchQueue.main.async {
                completion()
            }
        }
                
        if !isDepositQueueRunning {
            DispatchQueue.global().async(group: group, execute: depositTask)
        }
        if !isLoanQueueRunning {
            DispatchQueue.global().async(group: group, execute: loanTask)
        }
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
        isDepositQueueRunning = false
        isLoanQueueRunning = false
    }
}

extension BankManager {
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
