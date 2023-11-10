//
//  UILabel.swift
//  BankManagerUIApp
//
//  Created by 전성수 on 11/10/23.
//

import UIKit

extension UILabel {
    convenience init(text: String, fontSize: CGFloat, textColor: UIColor, backgroundColor: UIColor, heightConstant: CGFloat?, widthConstant: CGFloat?) {
        self.init(frame: .zero)
        
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.font = UIFont.systemFont(ofSize: fontSize)
        
        if let constant = heightConstant {
            self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        }
        
        if let constant = widthConstant {
            self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        }
        
    }
}
