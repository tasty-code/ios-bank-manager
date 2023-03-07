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
    private static var bankTeller = [Teller]()
    private static var clientsPerDay = 0

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
        Bank.bankTeller.removeAll()
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
        Bank.clientsPerDay = 0
        let openTime = Date().now()
        assignBanking()
        let takenTime = Date().takenTime(from: openTime)
        printMessage(message: .endBanking(clients: Bank.clientsPerDay, takenTime: takenTime))
    }

    private func assignBanking() {
        let group = DispatchGroup()
        Bank.bankTeller.forEach { teller in
            serveClient(teller, group: group)
        }
        group.wait()
    }

    private func serveClient(_ teller: Teller, group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            let queue = bankQueue.queue(type: teller.type)
            let semaphore = bankQueue.semaphore(type: teller.type)
            while !queue.isEmpty() {
                semaphore.wait()
                guard let client = queue.dequeue() else { return }
                Bank.clientsPerDay += 1
                semaphore.signal()
                teller.assist(client)
            }
        }
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

private extension Date {
    func now() -> Double {
        return Double(self.timeIntervalSince1970)
    }

    func takenTime(from openTime: Double) -> Double {
        let takenTime = Double(self.timeIntervalSince1970) - openTime
        return takenTime.floor()
    }
}

private extension Double {
    func floor() -> Double {
        var tmp = self * 10
        tmp.round(.down)
        return tmp / 10
    }
}
