//
//  ClientListDataSource.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/7/24.
//

import UIKit

enum ClientListSection {
    case client
}

enum ClientListItem: Hashable {
    case client(Client)
}

typealias ClientListSnapShot = NSDiffableDataSourceSnapshot<ClientListSection, ClientListItem>

final class ClientListDataSource: UITableViewDiffableDataSource<ClientListSection, ClientListItem> {
    typealias TableView = ClientListTableView
    typealias ClientCell = ClientListTableViewCell
    
    static let cellProvider: CellProvider = { tableview, indexPath, itemIdentifier in
        switch itemIdentifier {
        case .client(let client):
            guard let cell = tableview.dequeueReusableCell(
                withIdentifier: ClientCell.reuseIdentifier, for: indexPath
            ) as? ClientCell else { return ClientCell() }
            cell.update(with: client)
            return cell
        }
    }
    
    convenience init(_ listView: TableView) {
        self.init(tableView: listView, cellProvider: Self.cellProvider)
    }
}
