//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by devxsby on 2023/02/21.
//

import Foundation

class Node<T> {
    let value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
