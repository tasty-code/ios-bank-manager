//
//  UIButton.swift
//  BankManagerUIApp
//
//  Created by 전성수 on 11/14/23.
//

import UIKit

extension UIButton {
    
    convenience init(_ title: String, _ color: UIColor) {
        self.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
    }
}
