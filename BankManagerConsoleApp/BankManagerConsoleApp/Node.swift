//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by devxsby on 2023/02/21.
//

import Foundation

class Node<T> {
    let data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
