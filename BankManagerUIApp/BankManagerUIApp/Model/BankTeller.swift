//
//  BankTeller.swift
//  BankManagerUIApp
//
//  Created by Mason Kim on 2023/03/09.
//

import Foundation

struct BankTeller {

    // MARK: - Properties

    let id: UUID = UUID()
    let workType: WorkType
    let serialQueue = DispatchQueue(label: "bankTellerQueue")

    // MARK: - Public

    func performTask(
        of customer: Customer,
        presenter: BankPresentable,
        group: DispatchGroup
    ) {
        serialQueue.async(group: group) {
            presenter.presentTaskStarted(of: customer)
            Thread.sleep(forTimeInterval: customer.timespent)
            presenter.presentTaskFinished(of: customer)
        }
    }
}
