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
    private var customersQueue: Queue<Customer> = Queue()

    private let bankWorkDispatchGroup = DispatchGroup()
    private var bankTellerAssignIndexCount: [WorkType: Int] = [:]

    private lazy var bankTellersByWorkType: [WorkType: [BankTeller]] = {
        return WorkType.allCases.reduce(into: [WorkType: [BankTeller]]()) { dictionary, workType in
            dictionary[workType] = bankTellers.filter {
                $0.workType == workType
            }
        }
    }()

    private lazy var semaphoreByWorkType: [WorkType: DispatchSemaphore] = {
        return bankTellersByWorkType.mapValues { bankTellers in
            DispatchSemaphore(value: bankTellers.count)
        }
    }()


    // MARK: - Lifecycle

    init(bankTellers: [BankTeller]) {
        self.bankTellers = bankTellers
    }

    // MARK: - Public

    func visit(customers: [Customer]) {
        customers.forEach {
            customersQueue.enqueue($0)
        }
    }

    func startWorking(completion: @escaping () -> Void) {
        for _ in 0..<customersQueue.count {
            guard let customer = customersQueue.dequeue() else { continue }
            assignTask(of: customer)
        }

        setNotifyAllTaskFinished(completion: completion)
    }

    // MARK: - Private

    private func assignTask(of customer: Customer) {
        let workType = customer.workType

        guard let semaphore = semaphoreByWorkType[workType],
              let bankTeller = bankTellerToAssignTask(of: workType) else { return }
        addBankTellerAssignIndexCount(of: workType)

        DispatchQueue.global().async(group: bankWorkDispatchGroup) {
            semaphore.wait()
            bankTeller.performTask(of: customer)
            semaphore.signal()
        }
    }

    private func setNotifyAllTaskFinished(completion: @escaping () -> Void) {
        bankWorkDispatchGroup.notify(queue: DispatchQueue.main) {
            completion()
        }
    }

    private func bankTellerToAssignTask(of type: WorkType) -> BankTeller? {
        let numberOfBankTellers = numberOfBankTellers(of: type)
        let index = (bankTellerAssignIndexCount[type] ?? 0) % numberOfBankTellers
        return bankTellersByWorkType[type]?[index]
    }

    private func numberOfBankTellers(of type: WorkType) -> Int {
        return bankTellersByWorkType[type]?.count ?? 0
    }

    private func addBankTellerAssignIndexCount(of type: WorkType) {
        bankTellerAssignIndexCount[type] = (bankTellerAssignIndexCount[type] ?? 0) + 1
    }
}
