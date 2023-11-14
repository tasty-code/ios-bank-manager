//
//  UILabel.swift
//  BankManagerUIApp
//
//  Created by Janine on 11/14/23.
//

import UIKit

extension UILabel {
    convenience init(text: String, fontSize: CGFloat, textColor: UIColor = .black, backgroundColor: UIColor = .systemBackground, align: NSTextAlignment = .center) {
        self.init()
        
        self.text = text
        self.textAlignment = align
        self.font = self.font.withSize(fontSize)
        self.adjustsFontSizeToFitWidth = true
        
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
}
