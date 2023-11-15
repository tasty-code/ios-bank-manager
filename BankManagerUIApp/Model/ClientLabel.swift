//
//  ClientLabel.swift
//  BankManagerUIApp
//
//  Created by 김진웅 on 11/14/23.
//

import UIKit

final class ClientLabel: UILabel {
    var client: Client
    
    init(client: Client) {
        self.client = client
        super.init(frame: .zero)
        self.identify()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func identify() {
        self.text = "\(client.id)번 - \(client.taskType)"
        self.font = .systemFont(ofSize: 23)
        
        switch client.taskType {
        case .loan:
            self.textColor = .systemPurple
        case .deposit:
            break
        }
    }
}
