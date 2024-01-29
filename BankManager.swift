//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var totalCustomers: Int = 0
    private var totalTime: Double = 0
    
    private let banker: Banker = Banker()
    private let queue: Queue<Customer> = Queue(linkedList: LinkedList())
    
    mutating func start() {
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
            startBankingProcess()
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomers)명이며, 총 업무시간은 \(String(format: "%.2f", totalTime))초입니다.")
            start()
        case "2":
            exit(0)
        default:
            break
        }
    }
    
    mutating func startBankingProcess() {
        totalCustomers = .random(in: 10...30)
        for i in 1...totalCustomers {
            queue.enqueue(node: Node(value: Customer(requiredTime: 0.7, waitingNumber: i)))
        }
        
        while queue.count() > 0 {
            guard let nextNode = queue.dequeue() else {
                return
            }
            let nextCustomer = nextNode.value
            totalTime += banker.doYourJob(customerInfo: nextCustomer)
        }
    }
}
