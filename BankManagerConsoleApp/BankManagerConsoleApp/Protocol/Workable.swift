//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by Jason on 2023/02/23.
//

import Foundation

protocol Workable {
    var identifier: String { get }
    mutating func working(responsibility: Int)
    mutating func finishing() -> Int
}
