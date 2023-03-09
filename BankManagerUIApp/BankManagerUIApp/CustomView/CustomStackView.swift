//
//  CustomStackView.swift
//  BankManagerUIApp
//
//  Created by 송선진 on 2023/03/09.
//

import UIKit

class CustomStackView: UIStackView {
    
    init(axis: NSLayoutConstraint.Axis) {
        super.init(frame: .zero)
        self.axis = axis
        
        basicConfiguration()
    }
    
    init(axis: NSLayoutConstraint.Axis, spacing: CGFloat ) {
        super.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
        
        basicConfiguration()
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
