//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {

    private let numberOfGuest: UInt = CustomerConstant.numberOfCustomer
    private let waitingQueue: WaitingQueue<CustomerInfo>

    // MARK: - init
        
    init(waitingQueue: WaitingQueue<CustomerInfo>) {
        self.waitingQueue = waitingQueue
    }

}

extension BankManager {

    private func generateWaiting(customers: UInt, to waitingQueue: WaitingQueue<CustomerInfo>) {
        (1...customers).forEach { number in
            let newCustomer = CustomerInfo(number: number)
            waitingQueue.enqueue(newCustomer)
        }
    }

    private func dealCustomer(group: DispatchGroup, completion: @escaping (CustomerInfo, Bool) -> Void) {
        let queue = DispatchQueue.global()
        var tellers = [Task:Teller]()

        Task.allCases.forEach { task in
            tellers[task] = Teller(task: task)
        }

        while let customer = waitingQueue.dequeue() {
            group.enter()
            guard let teller = tellers[customer.task] else { return }

            queue.async(group: group) {
                teller.work() { bool in
                    completion(customer, bool)
                }
            }

            group.leave()
        }
    }

    private func report(waitingNumber: UInt, task: Task, inProgress: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, task.rawValue, inProgress))
    }

    private func finalReport(time: Double) {
        InputOutputManager.output(state: .close(numberOfGuest, time))
    }

}

extension BankManager: BankProtocol {

    func open() {
        generateWaiting(customers: numberOfGuest, to: waitingQueue)

        let group = DispatchGroup()
        var totalDuration = 0.0
        dealCustomer(group: group) { result,bool  in
            report(waitingNumber: result.number, task: result.task, inProgress: bool)
            totalDuration += Task.duration(of: result.task)
        }
        group.wait()
        close(time: totalDuration)
    }

    func close(time: Double) {
        finalReport(time: time)
    }

}
