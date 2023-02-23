//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Teller {
    func assist(queue: Queue<Int>) {
        let client = getFirstClient(from: queue)
        assist(client!)
    }
    
    private func getFirstClient(from queue: Queue<Int>) ->  Int? {
        return queue.dequeue()
    }
    
    private func assist(_ client: Int){
        print("\(client)번 고객 업무 시작")
        usleep(700000)
        print("\(client)번 고객 업무 완료")
    }
}

while true {
    bankOpener()
    if readLine() == "2" {
        break
    }
    let queue = Queue<Int>()
    let customer = Int.random(in: 10...30)
    
    for a in 1...customer {
        queue.enqueue(a)
    }
    
    let openTime = Double(Date().timeIntervalSince1970)
    let teller = Teller()
    while !queue.isEmpty() {
        teller.assist(queue: queue)
    }
    let closeTime = Double(Date().timeIntervalSince1970)
    let takenTime = String(format: "%.1f", closeTime - openTime)
    
    print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer)명이며, 총 업무시간은 \(takenTime)초입니다.")
}

func bankOpener() {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: "")
}
