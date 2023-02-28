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
            switch try command(){
            case .open:
                startBanking()
            case .close:
                return
            }
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
        enqueueCustomers()
        var customersPerDay = 0
        let openTime = Date().now()

        while let customer = dequeue(from: queue) {
            teller.assist(customer)
            customersPerDay += 1
        }

        let takenTime = Date().takenTime(from: openTime)
        printMessage(message: .endBanking(customers: customersPerDay, takenTime: takenTime))
    }

    private func dequeue(from customerQueue: Queue<Int>) -> Int? {
        return customerQueue.dequeue()
    }

    private func enqueueCustomers() {
        let customers = Int.random(in: Constants.rangeOfCustomers)
        for customer in 1...customers {
            queue.enqueue(customer)
        }
    }
}

extension Date {
    fileprivate func now() -> Double {
        return Double(self.timeIntervalSince1970)
    }

    fileprivate func takenTime(from openTime: Double) -> Double {
        let takenTime = Double(self.timeIntervalSince1970) - openTime
        return takenTime.floor()
    }
}

extension Double {
    fileprivate func floor() -> Double {
        var tmp = self * 10
        tmp.round(.down)
        return tmp / 10
    }
}
