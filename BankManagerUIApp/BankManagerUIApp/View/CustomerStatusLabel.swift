//
//  CustomerStatusLabel.swift
//  BankManagerUIApp
//
//  Created by Mason Kim on 2023/03/09.
//

import UIKit

final class CustomerStatusLabel: UILabel {

    let customer: Customer

    // MARK: - Lifecycle

    init(customer: Customer) {
        self.customer = customer
        super.init(frame: .zero)

        configureText()
        configureTextColor()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func configureText() {
        text = "\(customer.id) - \(customer.workType.description)"
        font = .preferredFont(forTextStyle: .body)
    }

    private func configureTextColor() {
        switch customer.workType {
        case .loan:
            textColor = .systemPurple
        case .deposit:
            textColor = .black
        }
    }
}
