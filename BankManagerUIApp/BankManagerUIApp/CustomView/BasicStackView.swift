//
//  CustomStackView.swift
//  BankManagerUIApp
//
//  Created by 송선진 on 2023/03/09.
//

import UIKit

final class BasicStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConfiguration()
    }
    
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init(frame: .zero)
        self.axis = axis
    }
    
    convenience init(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment) {
        self.init(frame: .zero)
        self.axis = axis
        self.alignment = alignment
    }
    
    func setupConfiguration() {
        self.spacing = 5
        distribution = .fillEqually
        alignment = .fill
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
