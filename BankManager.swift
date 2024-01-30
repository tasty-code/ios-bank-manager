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
    
    mutating func main() {
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
            main()
        case "2":
            exit(0)
        default:
            break
        }
    }
    
    mutating func startBankingProcess() {
        setupInitialInformation()
        
        while !queue.isEmpty() {
            guard let node = queue.dequeue() else {
                return
            }
            let customer = node.value
            totalTime += banker.provideService(to: customer)
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomers)명이며, 총 업무시간은 \(String(format: "%.2f", totalTime))초입니다.")
    }
    
    mutating private func setupInitialInformation() {
        totalCustomers = .random(in: 10...30)
        totalTime = 0
        
        for i in 1...totalCustomers {
            queue.enqueue(node: Node(value: Customer(requiredTime: 0.7, waitingNumber: i)))
        }
    }
}
