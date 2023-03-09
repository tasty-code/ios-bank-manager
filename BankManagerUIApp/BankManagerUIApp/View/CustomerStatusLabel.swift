//
//  CustomerStatusLabel.swift
//  BankManagerUIApp
//
//  Created by Mason Kim on 2023/03/09.
//

import UIKit

final class CustomerStatusLabel: UILabel {

    // MARK: - Lifecycle

    init(customer: Customer) {
        super.init(frame: .zero)

        configureText(with: customer)
        configureTextColor(with: customer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private func configureText(with customer: Customer) {
        text = "\(customer.id) - \(customer.workType.rawValue)"
        font = .preferredFont(forTextStyle: .body)
    }

    private func configureTextColor(with customer: Customer) {
        switch customer.workType {
        case .loan:
            textColor = .systemPurple
        case .deposit:
            textColor = .black
        }
    }
}
