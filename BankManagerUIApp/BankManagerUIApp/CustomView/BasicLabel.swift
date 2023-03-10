//
//  BasicLabel.swift
//  BankManagerUIApp
//
//  Created by 송선진 on 2023/03/10.
//

import UIKit

final class BasicLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(systemFontSize: CGFloat) {
        self.init(frame: .zero)
        
        self.font = UIFont.systemFont(ofSize: systemFontSize)
    }
    
    convenience init(systemFontSize: CGFloat, textAlignnment: NSTextAlignment) {
        self.init(frame: .zero)
        
        self.font = UIFont.systemFont(ofSize: systemFontSize)
        self.textAlignment = textAlignnment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
