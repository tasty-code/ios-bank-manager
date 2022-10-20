//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let waitingNumberQueue = Bank().setClientOfWaitingNumber()
    private let workTime: Double = 0.7
    
    func work() {
        let waitingNumber = waitingNumberQueue.count
        
        func workStart() {
            let firstWaitingNumber: Int = 1
            let lastWaitingNumber: Int = waitingNumber
            for _ in firstWaitingNumber...lastWaitingNumber {
                guard let client = waitingNumberQueue.dequeue() else { return }
                print("\(client)번 고객 업무 시작")
                print("\(client)번 고객 업무 종료")
            }
        }
            
        func workFinish() {
            let totalWorkTime: Double = workTime * Double(waitingNumber)
            let strTotalWorkTime = String(format: "%.2f", totalWorkTime)
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(waitingNumber)명 이며, 총 업무시간은 \(strTotalWorkTime)초입니다.")
        }
        workStart()
        workFinish()
    }
}
