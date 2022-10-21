//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 박도원 on 2022/10/21.
//

import Foundation

struct BankClerk {
    func work(waitingNumberQueue: BankManager) {
        let clientQueue = waitingNumberQueue.setClientOfWaitingNumber(clientQueue: Queue<Client>())
        let waitingNumber = clientQueue.count
        
        func workStart() {
            let firstWaitingNumber: Int = 1
            let lastWaitingNumber: Int = waitingNumber
            for _ in firstWaitingNumber...lastWaitingNumber {
                guard let client = clientQueue.dequeue() else { return }
                print("\(client.waitingNumber)번 고객 업무 시작")
                print("\(client.waitingNumber)번 고객 업무 종료")
            }
        }
            
        func workFinish(workTime: Double) {
            let totalWorkTime: Double = workTime * Double(waitingNumber)
            let strTotalWorkTime = String(format: "%.2f", totalWorkTime)
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(waitingNumber)명 이며, 총 업무시간은 \(strTotalWorkTime)초입니다.")
        }
        workStart()
        workFinish(workTime: 0.7)
    }
}
