//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by devxsby on 2023/02/21.
//

import Foundation

class Node<Value: Equatable> {
    let value: Value
    var next: Node?
    
    init(value:Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
