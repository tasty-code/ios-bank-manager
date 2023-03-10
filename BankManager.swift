//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {

    private let numberOfGuest: UInt = CustomerConstant.numberOfCustomer
    private let waitingQueue: WaitingQueue<Customer>

    // MARK: - init
        
    init(waitingQueue: WaitingQueue<Customer>) {
        self.waitingQueue = waitingQueue
    }

}

extension BankManager {

    private func generateWaiting(customers: UInt) {
        (1...customers).forEach { number in
            waitingQueue.enqueue(Customer(number: number, task: Task.randomTask()))
        }
    }
    
    private func makeTeller() -> [Task: Teller] {
        var tellers = [Task: Teller]()

        Task.allCases.forEach { task in
            tellers[task] = Teller(task: task)
        }
        return tellers
    }

    private func dealCustomer(group: DispatchGroup, completion: @escaping (Customer, Bool) -> Void) {
        let queue = DispatchQueue.global()
        let tellers = makeTeller()

        while let customer = waitingQueue.dequeue() {
            group.enter()
            guard let teller = tellers[customer.task] else { return }
    
            queue.async(group: group) {
                teller.work() { processState in
                    completion(customer, processState)
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
        generateWaiting(customers: numberOfGuest)

        let group = DispatchGroup()
        var totalDuration = 0.0
        dealCustomer(group: group) { customer, processState  in
            report(waitingNumber: customer.number, task: customer.task, inProgress: processState)
            totalDuration += Task.duration(of: customer.task)
        }
        group.wait()
        close(time: totalDuration)
    }

    func close(time: Double) {
        finalReport(time: time)
    }

}
