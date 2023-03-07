//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/23.
//

import Foundation

final class Bank {

    // MARK: - Private property

    private var bankTellers: [BankTeller]
    private var customersQueue: Queue<Customer> = Queue()

    private lazy var bankTellersByWorkType: [WorkType: [BankTeller]] = {
        return WorkType.allCases.reduce(into: [WorkType: [BankTeller]]()) { dictionary, workType in
            dictionary[workType] = bankTellers.filter { $0.workType == workType }
        }
    }()

    private lazy var semaphoreByWorkType: [WorkType: DispatchSemaphore] = {
        return bankTellersByWorkType.mapValues { bankTellers in
            DispatchSemaphore(value: bankTellers.count)
        }
    }()

    private let bankWorkDispatchGroup = DispatchGroup()


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

    func startWorking() {
        for _ in 0..<customersQueue.count {
            guard let customer = customersQueue.peek else { continue }
            
            bankTellers.first?.performTask(of: customer)
            customersQueue.dequeue()
        }
    }

    // MARK: - Private

    private func assignTask(of customer: Customer) {
        let workType = customer.workType

        guard let semaphore = semaphoreByWorkType[workType],
              let bankTeller = bankTellersByWorkType[workType]?.first else { return }

        DispatchQueue.global().async(group: bankWorkDispatchGroup) {
            semaphore.wait()
            bankTeller.performTask(of: customer)
            semaphore.signal()
        }
    }
}
