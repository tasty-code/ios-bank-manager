//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/22/24.
//

class Node<Value> {
    let value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
