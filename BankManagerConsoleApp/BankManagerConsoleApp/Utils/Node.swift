//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 2/1/24.
//

final class Node<Value> {
    let value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
