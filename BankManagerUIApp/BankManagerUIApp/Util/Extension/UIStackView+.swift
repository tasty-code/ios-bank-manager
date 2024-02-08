//
//  UIStackView+.swift
//  BankManagerUIApp
//
//  Created by EUNJU on 2024/02/07.
//

import UIKit

extension UIStackView {
    
    /// 다수의 View를 StackView에 한꺼번에 추가하는 메서드
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
