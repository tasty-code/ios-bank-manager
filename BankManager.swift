//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func work() {
        let clientNumber = Client().randomClientNumber()
        let clientList = Queue<Int>()
        
        for i in 1...clientNumber {
            clientList.enqueue(data: i)
            guard let client = clientList.dequeue() else { return }
            print("\(client) 번 고객 업무 시작")
            print("\(client) 번 고객 업무 종료")
        }
    }
    
}
