//
//  UIStackView.swift
//  BankManagerUIApp
//
//  Created by Janine on 11/14/23.
//

import UIKit

extension UIStackView {
    convenience init(spacing: CGFloat, axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution = .fill, align: UIStackView.Alignment = .fill) {
        self.init()
        self.spacing = spacing
        self.axis = axis
        self.distribution = distribution
        self.alignment = align
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addArrangedSubViews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
