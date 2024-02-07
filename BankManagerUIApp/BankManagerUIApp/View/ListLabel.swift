//
//  ListLabel.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/7/24.
//

import UIKit

final class ListLabel: UILabel {
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.textAlignment = .center
        self.font = .preferredFont(forTextStyle: .title3)
    }
    
    init(client: Client) {
        super.init(frame: .zero)
        self.textAlignment = .center
        self.font = .preferredFont(forTextStyle: .title3)
        configure(client: client)
    }
    
    func configure(client: Client) {
        self.text = "\(client.number) - \(client.task)"
        switch client.task {
        case .deposit:
            self.textColor = .black
        case .loan:
            self.textColor = .purple
        }
    }
}
