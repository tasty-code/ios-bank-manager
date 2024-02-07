//
//  ListView.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/7/24.
//

import UIKit

final class ListView: UIView {
    typealias Label = ListLabel
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let list: ListStackView = ListStackView()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(type: BankList) {
        super.init(frame: .zero)
        self.titleLabel.text = type.name
        self.titleLabel.backgroundColor = type.backgroundColor
        setLayout()
    }
    
    private func setLayout() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.list)
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.list.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            
            self.list.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.list.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.list.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.list.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
        ])
        
        let listViewHeight = self.list.heightAnchor.constraint(equalToConstant: 1)
        listViewHeight.priority = .defaultLow
        listViewHeight.isActive = true
    }
    
    func addLabel(client: Client) {
        let label = Label(client: client)
        self.list.addArrangedSubview(label)
    }
}
