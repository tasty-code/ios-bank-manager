//
//  UILabel.swift
//  BankManagerUIApp
//
//  Created by 전성수 on 11/10/23.
//

import UIKit

extension UILabel {
    convenience init(_ text: String, _ fontSize: CGFloat,_ textColor: UIColor,_ textAlignment: NSTextAlignment ,_ backgroundColor: UIColor) {
        self.init(frame: .zero)
        
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.backgroundColor = backgroundColor
        self.font = UIFont.systemFont(ofSize: fontSize)
        
    }
}
