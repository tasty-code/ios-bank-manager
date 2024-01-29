//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var totalCustomers: Int
    private var totalTime: Double
    
    private let banker: Banker = Banker()
    private let queue: Queue<Customer> = Queue(linkedList: LinkedList())
    
    init(totalCustomers: Int, totalTime: Double) {
        self.totalCustomers = totalCustomers
        self.totalTime = totalTime
    }
    
    func printMenu() {
        print("""
            1 : 은행 개점
            2 : 종료
            입력 :
            """, terminator: " ")
        let selectedMenu = readLine()
    }
}
