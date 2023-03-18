//
//  Extension+StackView.swift
//  BankManagerUIApp
//
//  Created by 송선진 on 2023/03/10.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
