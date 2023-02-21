//
//  NodeProtocol.swift
//  BankManagerConsoleApp
//
//  Created by 송선진 on 2023/02/21.
//

import Foundation

protocol Node {
    associatedtype T
    var value: T { get }
    var next: Self? { get set }
}


