//
//  CustomerLabel.swift
//  BankManagerUIApp
//
//  Created by Swain Yun on 11/13/23.
//

import UIKit

final class CustomerLabel: UILabel {
    private let customer: Customer
    
    init(_ customer: Customer) {
        self.customer = customer
        super.init(frame: .zero)
        
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Did not implemented.")
    }
    
    private func configureLabel() {
        self.text = "\(customer.id) - \(customer.workType)"
        self.textColor = customer.workType == .deposit ? .black : .systemPurple
        self.font = .preferredFont(forTextStyle: .headline)
        self.textAlignment = .center
    }
}
