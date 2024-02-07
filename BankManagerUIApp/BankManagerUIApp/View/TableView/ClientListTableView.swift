//
//  ClientListTableView.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/7/24.
//

import UIKit

final class ClientListTableView: UITableView {
    typealias ClientCell = ClientListTableViewCell
    typealias DataSource = ClientListDataSource
    typealias HeaderView = ClientListHeaderView
    
    let type: BankList
    
    init(type: BankList) {
        self.type = type
        super.init(frame: .zero, style: .plain)
        self.separatorStyle = .none
        setCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getHeader() -> HeaderView {
        return HeaderView(type: self.type)
    }
}

extension ClientListTableView: ReusableView {
    private func setCollection() {
        register(ClientCell.self)
    }
}
