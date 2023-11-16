//
//  UIStackView.swift
//  BankManagerUIApp
//
//  Created by 전성수 on 11/14/23.
//

import UIKit

extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat?, distribution: Distribution) {
        self.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.spacing = spacing ?? 0
        self.distribution = distribution
    }
    
}
