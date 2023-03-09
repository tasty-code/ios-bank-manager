//
//  CustomStackView.swift
//  BankManagerUIApp
//
//  Created by 송선진 on 2023/03/09.
//

import UIKit

class CustomStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        basicConfiguration()
    }
    
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init(frame: .zero)
        self.axis = axis
    }
    
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat ) {
        self.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
    }
    
    func basicConfiguration() {
        distribution = .fillEqually
        alignment = .fill
        spacing = 0
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
