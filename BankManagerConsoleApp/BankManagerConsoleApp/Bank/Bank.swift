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
    let bankQueue = BankQueue()
    let loanTeller = Teller(type: .loan)
    let depositTeller = Teller(type: .deposit)
    private static var bankTeller = [Teller]()

    func execute() {
        printMessage(message: .startBanking)
        do {
            switch try command(){
            case .open:
                seatedTeller()
                startBanking()
            case .close:
                return
            }
        } catch {
            print(error.localizedDescription)
        }
        execute()
    }

    private func seatedTeller() {
        Constants.tellerStaffing.forEach { (bankingType, tellerCount) in
            for _ in 1...tellerCount {
                let teller = Teller.init(type: bankingType)
                Bank.bankTeller.append(teller)
            }
        }
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
        enqueueClients()
        var clientsPerDay = 0
        let openTime = Date().now()
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            while let client = bankQueue.queue(type: .loan).dequeue() {
                loanTeller.assist(client)
                clientsPerDay += 1
            }
        }
        
        DispatchQueue.global().async(group: group) {
            while let client = bankQueue.queue(type: .deposit).dequeue() {
                depositTeller.assist(client)
                clientsPerDay += 1
            }
        }
        group.wait()

        let takenTime = Date().takenTime(from: openTime)
        printMessage(message: .endBanking(clients: clientsPerDay, takenTime: takenTime))
    }

    private func enqueueClients() {
        let visitedClients = Int.random(in: Constants.rangeOfClients)
        for waitingNumber in 1...visitedClients {
            let client = Client(waitingNumber: waitingNumber)
            let queue = bankQueue.queue(type: client.type)
            queue.enqueue(client)
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
