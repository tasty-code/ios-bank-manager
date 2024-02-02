//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var totalCustomers: Int = 0
    private var totalTimeSpent: Double = 0
    
    private let banker: Banker = Banker()
    private let depositCustomerQueue: Queue<Customer> = Queue(linkedList: LinkedList())
    private let loanCustomerQueue: Queue<Customer> = Queue(linkedList: LinkedList())
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
    
    func main() {
        print("""
        1 : 은행 개점
        2 : 종료
        입력 :
        """, terminator: " ")
        
        guard let selectedMenu = readLine() else {
            return
        }
        
        switch selectedMenu {
        case "1":
            startBankingProcess { customer, time in
                print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer)명이며, 총 업무시간은 \(String(format: "%.2f", time))초입니다.")
            }
        case "2":
            return
        default:
            print("잘못된 입력입니다. 다시 입력해 주세요.")
            main()
            return
        }
    }
    
    private func startBankingProcess(completionHandler: @escaping (_ customer: Int, _ time: Double) -> Void) {
        let totalCustomers: Int = setupInitialInformation()
        
        let startTime = Date()
        
        let depositCustomerBlock = BlockOperation {
            while !depositCustomerQueue.isEmpty() {
                guard let node = depositCustomerQueue.dequeue() else {
                    return
                }
                let customer = node.value
                let customerBlock = BlockOperation {
                    self.banker.provideService(to: customer)
                }
                depositQueue.addOperation(customerBlock)
                if depositQueue.isSuspended {
                    depositQueue.waitUntilAllOperationsAreFinished()
                }
            }
        }
        
        let loanCustomerBlock = BlockOperation {
            while !loanCustomerQueue.isEmpty() {
                guard let node = loanCustomerQueue.dequeue() else {
                    return
                }
                let customer = node.value
                let customerBlock = BlockOperation {
                    self.banker.provideService(to: customer)
                }
                loanQueue.addOperation(customerBlock)
                loanQueue.waitUntilAllOperationsAreFinished()
            }
        }
        
        let completionBlock = BlockOperation {
            let endTime = Date()
            let duration = endTime.timeIntervalSince(startTime)
            completionHandler(totalCustomers, duration)
        }
        completionBlock.addDependency(depositCustomerBlock)
        completionBlock.addDependency(loanCustomerBlock)
        
        OperationQueue().addOperations([depositCustomerBlock, loanCustomerBlock, completionBlock], waitUntilFinished: true)
        main()
    }
    
    private func setupInitialInformation() -> Int {
        let totalCustomers: Int = .random(in: 10...30)
        
        for i in 1...totalCustomers {
            let randomService: BankingService = BankingService.allCases.randomElement() ?? .deposit
            switch randomService {
            case .deposit:
                depositCustomerQueue.enqueue(node: Node(value: Customer(waitingNumber: i, requiredService: randomService)))
            case .loan:
                loanCustomerQueue.enqueue(node: Node(value: Customer(waitingNumber: i, requiredService: randomService)))
            }
        }
        
        return totalCustomers
    }
}
