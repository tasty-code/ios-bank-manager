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

enum BankState: String, CaseIterable{
    case open = "1"
    case close = "2"
}

enum BankError {
    case invalidCommand
}

extension BankError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidCommand:
            return "선택이 잘못되었습니다. 확인 후 다시 입력해주세요."
        }
    }
}

struct Bank {
    let queue = Queue<Int>()
    let bankmanager = BankManager()

    func execute() {
        BankMessage.startBanking.description()
        do {
            let command = try command()
            guard command == .open else {
                return
            }
            startBanking()
        } catch {
            print(error.localizedDescription)
        }
        execute()
    }

    private func command() throws -> BankState {
        guard let input = readLine() else {
            return .close
        }
        guard let command = BankState(rawValue: input) else {
            throw BankError.invalidCommand
        }
        return command
    }

    private func startBanking() {
        let visitedCustomers = visitedCustomers()
        let openTime = Double(Date().timeIntervalSince1970)
        while let customer = dequeue(from: queue) {
            bankmanager.assist(customer)
        }
        let closeTime = Double(Date().timeIntervalSince1970)
        let takenTime = String(format: "%.1f", closeTime - openTime)
        BankMessage.endBanking(customers: visitedCustomers, takenTime: takenTime).description()
    }

    private func dequeue(from customerQueue: Queue<Int>) -> Int? {
        return customerQueue.dequeue()
    }

    private func visitedCustomers() -> Int {
        let customers = Int.random(in: 10...30)
        for customer in 1...customers {
            queue.enqueue(customer)
        }
        return customers
    }
}
