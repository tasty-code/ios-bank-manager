//
//  ClientListTableViewCell.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/7/24.
//

import UIKit

final class ClientListTableViewCell: UITableViewCell {
    private let label: ListLabel = ListLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with client: Client) {
        self.label.configure(client: client)
    }
    
    private func setLayout() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        NSLayoutConstraint.activate([
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
        ])
    }
}

extension ClientListTableViewCell: ReusableView { }
