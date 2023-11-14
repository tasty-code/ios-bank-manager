//
//  UIButton.swift
//  BankManagerUIApp
//
//  Created by Janine on 11/14/23.
//

import UIKit

extension UIButton {
    convenience init(title: String, titleColor: UIColor, align: NSTextAlignment = .center) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.textAlignment = align
    }
}
