//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 박재우 on 2023/02/23.
//

import Foundation

enum BankState: String {
    case open = "1"
    case close = "2"
}

struct Bank: ConsoleMessagable {
    let queue = Queue<Int>()
    let teller = Teller()

    func execute() {
        printMessage(message: .startBanking)
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
            teller.assist(customer)
        }
        let closeTime = Double(Date().timeIntervalSince1970)
        let takenTime = String(format: "%.1f", closeTime - openTime)
        printMessage(message: .endBanking(customers: visitedCustomers, takenTime: takenTime))
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
