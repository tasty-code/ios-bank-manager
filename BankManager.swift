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
    
    func printMenu() {
        print("""
            1 : 은행 개점
            2 : 종료
            입력 :
            """, terminator: " ")
        guard let selectedMenu = readLine() else {
            return
        }
        let randomCustomerCount: Int = .random(in: 10...30)
        let requiredTime: Double = 0.7 * Double(randomCustomerCount)
        
        switch selectedMenu {
        case "1":
            for i in 1...randomCustomerCount {
                banker.serviceDidStart(customerNumber: i)
                banker.serviceDidComplete(customerNumber: i)
            }
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(randomCustomerCount)명이며, 총 업무시간은 \(String(format: "%.2f", requiredTime))초입니다.")
            printMenu()
        case "2":
            exit(0)
        default:
            break
        }
    }
}
