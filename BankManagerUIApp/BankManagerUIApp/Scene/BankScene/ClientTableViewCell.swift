//
//  ClientTableViewCell.swift
//  BankManagerUIApp
//
//  Created by EUNJU on 2024/02/07.
//

import UIKit

final class ClientTableViewCell: UITableViewCell {
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
        $0.font = .systemFont(ofSize: 20, weight: .medium)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        titleLabel.textColor = .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        selectionStyle = .none
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setUpData(data: Client) {
        titleLabel.text = "\(data.number) - \(data.bankTask.description)"
        titleLabel.textColor = data.bankTask == .loan ? .systemPurple : .black
    }
}
