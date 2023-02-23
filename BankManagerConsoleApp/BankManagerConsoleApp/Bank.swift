//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 박재우 on 2023/02/23.
//

import Foundation

enum BankMessage {
    case startBanking
    case endBanking(customers: Int, takenTime: String)
}

extension BankMessage {
    func description() {
        switch self {
        case .startBanking:
            print("1 : 은행개점\n2 : 종료\n입력 : ", terminator: "")
        case .endBanking(let customers, let takenTime):
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(takenTime)초입니다.")
        }
    }
}

struct Bank {
    let queue = Queue<Int>()
    let bankmanager = BankManager()

    func startBanking() {
        BankMessage.startBanking.description()
        if readLine() == "2" {
            exit(0)
        }
        let customers = createCustomer()
        let openTime = Double(Date().timeIntervalSince1970)
        while !queue.isEmpty() {
            bankmanager.assist(queue: queue)
        }
        let closeTime = Double(Date().timeIntervalSince1970)
        let takenTime = String(format: "%.1f", closeTime - openTime)
        BankMessage.endBanking(customers: customers, takenTime: takenTime).description()
    }

    private func createCustomer() -> Int {
        let customers = Int.random(in: 10...30)
        for customer in 1...customers {
            queue.enqueue(customer)
        }
        return customers
    }
}
