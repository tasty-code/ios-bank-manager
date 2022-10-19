//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let clientNumber = Client().randomClientNumber()
    let clientQueue = Queue<Int>()
    let workTime: Double = 0.7
    
    func workStart() {
        let firstClient: Int = 1
        let lastClient: Int = clientNumber
        
        for client in firstClient...lastClient {
            clientQueue.enqueue(data: client)
            guard let client = clientQueue.dequeue() else { return }
            print("\(client)번 고객 업무 시작")
            print("\(client)번 고객 업무 종료")
        }
    }
    
    func workFinish() {
        let totalWorkTime: Double = workTime * Double(clientNumber)
        let strTotalWorkTime = String(format: "%.2f", totalWorkTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientNumber)명 이며, 총 업무시간은 \(strTotalWorkTime)초입니다.")
    }
}
