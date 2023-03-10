//
//  BankTeller.swift
//  BankManagerUIApp
//
//  Created by Mason Kim on 2023/03/09.
//

import Foundation

final class BankTeller {
    enum Status {
        case working
        case finished
    }

    // MARK: - Properties

    let workType: WorkType
    var status: Status = .finished

    init(workType: WorkType) {
        self.workType = workType
    }

    // MARK: - Public

    func performTask(
        of customer: Customer,
        presenter: BankPresentable
    ) {
        status = .working
        presenter.presentTaskStarted(of: customer)
        Thread.sleep(forTimeInterval: customer.timespent)
        presenter.presentTaskFinished(of: customer)
        status = .finished
    }
}
