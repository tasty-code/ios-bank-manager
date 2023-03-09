//
//  CustomerInfoView.swift
//  BankManagerUIApp
//
//  Created by DONGWOOK SEO on 2023/03/09.
//

import UIKit

class CustomerInfoView: UIView {
    let ticketNumber = UILabel()
    let hyphenLabel = UILabel()
    let taskTypeLabel = UILabel()
    
    override init(frame: CGRect) {
        ticketNumber.text = "0"
        hyphenLabel.text = "-"
        taskTypeLabel.text = "Task"
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
