//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/23.
//

import Foundation

final class Bank {

    // MARK: - Private property

    private let bankTellers: [BankTeller]
    private let bankWorkDispatchGroup = DispatchGroup()

    private let semaphoreByWorkType: [WorkType: DispatchSemaphore] = {
        WorkType.allCases.reduce(into: [WorkType: DispatchSemaphore]()) { dictionary, workType in
            dictionary[workType] = DispatchSemaphore(value: 1)
        }
    }()

    private let customerQueueByWorkType: [WorkType: Queue<Customer>] = {
        WorkType.allCases.reduce(into: [WorkType: Queue<Customer>]()) { dictionary, workType in
            dictionary[workType] = Queue()
        }
    }()


    // MARK: - Lifecycle

    init(bankTellers: [BankTeller]) {
        self.bankTellers = bankTellers
    }

    // MARK: - Public

    func visit(customers: [Customer]) {
        customers.forEach { customer in
            customerQueueByWorkType[customer.workType]?.enqueue(customer)
        }
    }

    func startWorking(completion: @escaping () -> Void) {
        bankTellers.forEach { bankTeller in
            DispatchQueue.global().async(group: bankWorkDispatchGroup) {
                self.assignTask(to: bankTeller)
            }
        }
        setNotifyAllTaskFinished(completion: completion)
    }

    // MARK: - Private

    private func assignTask(to bankTeller: BankTeller) {
        guard let queue = self.customerQueueByWorkType[bankTeller.workType],
              let semaphore = semaphoreByWorkType[bankTeller.workType] else { return }

        while !queue.isEmpty {
            semaphore.wait()
            guard let customer = queue.dequeue() else { return }
            semaphore.signal()

            bankTeller.performTask(of: customer)
        }
    }

    private func setNotifyAllTaskFinished(completion: @escaping () -> Void) {
        bankWorkDispatchGroup.notify(queue: DispatchQueue.main) {
            completion()
        }
    }
}
