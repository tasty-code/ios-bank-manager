//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Matthew on 1/23/24.
//

import Foundation

class Node<T> {
    
    var prev: Node<T>?
    var value: T
    var next: Node<T>?
    
    init(prev: Node<T>? = nil, value: T, next: Node<T>? = nil) {
        self.prev = prev
        self.value = value
        self.next = next
    }
}
