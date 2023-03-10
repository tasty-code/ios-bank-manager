//
//  CustomerInfoView.swift
//  BankManagerUIApp
//
//  Created by DONGWOOK SEO on 2023/03/09.
//

import UIKit

class CustomerInfoView: UIView {
    
    var ticketNumber = BasicLabel(systemFontSize: 25)
    
    let hyphenLabel = BasicLabel(systemFontSize: 25)
    let taskTypeLabel = BasicLabel(systemFontSize: 25)
    
    let infoStackView: BasicStackView = {
        let sv = BasicStackView(axis: .horizontal)
        sv.distribution = .equalSpacing
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ticketNumber.text = "0"
        hyphenLabel.text = "-"
        taskTypeLabel.text = "Task"
        
        setLabelLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLabelLayout() {
        addSubview(infoStackView)
        
        infoStackView.addArrangedSubviews([ticketNumber, hyphenLabel, taskTypeLabel])
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        infoStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        infoStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        infoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
    }
    
}
