//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 문성진 on 2022/10/12.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
