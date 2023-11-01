//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

while true {
    print("1 : 은행 개점 \n2 : 종료")
    print("입력 : ", terminator: "")
    guard let userInput = readLine() else { break }
    
    if userInput == "1" {
        
        // 고객 랜덤 생성
        let customer = Int.random(in: 10...30)
        
        // 큐에 넣어야 하는 듯?
        let queue = Queue<Int>()
        
        for n in 1...customer {
            queue.enqueue(data: n)
        }
        
        let bankClerk = BankClerk(bankClerk: 1)
        bankClerk.makeTask(queue: queue, customer: customer)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer)명이며, 총 업무시간은 \(Double(customer) * 0.7)초 입니다.")
        
    } else if userInput == "2" {
        break
    } else {
        // 에러 처리
    }
}

