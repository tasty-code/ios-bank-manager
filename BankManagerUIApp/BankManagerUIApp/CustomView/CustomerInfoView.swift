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
        sv.spacing = 5
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        ticketNumber.text = "0"
        ticketNumber.font = UIFont.systemFont(ofSize: 25)
        
        hyphenLabel.text = "-"
        hyphenLabel.font = UIFont.systemFont(ofSize: 25)
        
        taskTypeLabel.text = "Task"
        taskTypeLabel.font = UIFont.systemFont(ofSize: 25)
        
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
