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
    
    let infoStackVIew: UIStackView = {
       let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.spacing = 0
        sv.axis = .horizontal
        sv.alignment = .center
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ticketNumber.text = "0"
        ticketNumber.font = UIFont.systemFont(ofSize: 30)
        ticketNumber.textAlignment = .right
        
        hyphenLabel.text = "-"
        hyphenLabel.font = UIFont.systemFont(ofSize: 30)
        hyphenLabel.textAlignment = .center
        
        taskTypeLabel.text = "Task"
        taskTypeLabel.textAlignment = .left
        taskTypeLabel.font = UIFont.systemFont(ofSize: 30)
        
        setLabelLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLabelLayout() {
        addSubview(infoStackVIew)
        
        infoStackVIew.addArrangedSubview(ticketNumber)
        infoStackVIew.addArrangedSubview(hyphenLabel)
        infoStackVIew.addArrangedSubview(taskTypeLabel)
        
        infoStackVIew.translatesAutoresizingMaskIntoConstraints = false
        infoStackVIew.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        infoStackVIew.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        infoStackVIew.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        infoStackVIew.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}
