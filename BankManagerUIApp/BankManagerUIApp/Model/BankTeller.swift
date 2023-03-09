//
//  BankTeller.swift
//  BankManagerUIApp
//
//  Created by Mason Kim on 2023/03/09.
//

import Foundation

struct BankTeller {

    // MARK: - Properties

    let id: Int
    let workType: WorkType
    let presenter: BankPresentable

    // MARK: - Public

    func performTask(of customer: Customer) {
        presenter.presentTaskStarted(of: customer)
        Thread.sleep(forTimeInterval: customer.timespent)
        presenter.presentTaskFinished(of: customer)
    }
}
