//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 세윤 on 2022/10/12.
//

import Foundation

class Node<T> {
    var data: T
    var node: Node
    
    init(data: T, node: Node) {
        self.data = data
        self.node = node
    }
}
