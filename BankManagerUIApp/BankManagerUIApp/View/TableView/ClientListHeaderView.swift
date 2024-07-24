//
//  ClientListHeaderView.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/7/24.
//

import UIKit

final class ClientListHeaderView: UITableViewHeaderFooterView {
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    init(type: BankList) {
        super.init(reuseIdentifier: Self.reuseIdentifier)
        setType(type: type)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setType(type: BankList) {
        self.titleLabel.text = type.name
        self.titleLabel.backgroundColor = type.backgroundColor
    }
    
    private func setLayout() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension ClientListHeaderView: ReusableView { }
