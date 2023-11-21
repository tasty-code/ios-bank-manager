//
//  UIComponentsExtension.swift
//  BankManagerUIApp
//
//  Created by 김수경 on 2023/11/13.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont = .systemFont(ofSize: 17), textColor: UIColor = .label, textAlignment: NSTextAlignment = .natural) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    convenience init(title: String, titleColor: UIColor, backgroundColor: UIColor = .clear) {
        self.init()
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fillEqually, spacing: CGFloat = 0.0, subViews: [UIView] = []) {
        self.init()
        
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        subViews.forEach {
            self.addArrangedSubview($0)
        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

