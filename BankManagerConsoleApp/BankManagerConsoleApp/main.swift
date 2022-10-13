//
//  main.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/12.
//

import Foundation

var clientNumber: Int?
var workTime: Double = 0.0
var bankManager: BankManager = BankManager()
var clientQueue = Queue<Int>()

private func showMenu() {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 :", terminator: " ")
    guard let input = readLine() else { return }
    print("?")
    print(type(of: input))
    
    switch input {
    case Menu.start:
        start()
    case Menu.exit:
        break
    default:
        print("잘못 입력하셨습니다.")
        showMenu()
    }
}

private func generateRandomClientNumber() -> Int {
    Int.random(in: 10...30)
}

private func start() {
    clientNumber = generateRandomClientNumber()
    guard let clients = clientNumber else { return }
    inputClient(clientNumber: clients)
    
    for _ in 1...clients {
        guard let client = clientQueue.dequeue() else { return }
        bankManager.startWork(for: client)
        workTime += 0.7
    }
    
    print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clients)명이며, 총 업무시간은 \(String(format: "%.2f", workTime))초 입니다.")
}

private func inputClient(clientNumber: Int) {
    for i in 1...clientNumber {
        clientQueue.enqueue(i)
    }
}
showMenu()
