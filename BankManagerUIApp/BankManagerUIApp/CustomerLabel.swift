//
//  CustomerLabel.swift
//  BankManagerUIApp
//
//  Created by 전성수 on 11/13/23.
//

import UIKit
import Foundation

final class CustomerLabel: UILabel {
    var customer: Customer
    
    
    init(customer: Customer) {
        let color: UIColor = customer.task.name == "예금" ? .black : .systemPurple
        self.customer = customer
        
        super.init(frame: .zero)
        
        self.text = "\(customer.id) - \(customer.task.name)"
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: 25)
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
