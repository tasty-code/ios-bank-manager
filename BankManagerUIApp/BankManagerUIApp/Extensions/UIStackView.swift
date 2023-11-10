//
//  UIView.swift
//  BankManagerUIApp
//
//  Created by Swain Yun on 11/10/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
