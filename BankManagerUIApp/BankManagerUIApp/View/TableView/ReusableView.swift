//
//  ReusableView.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/7/24.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func register<Cell: ReusableView & AnyObject>(_ cellType: Cell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}

