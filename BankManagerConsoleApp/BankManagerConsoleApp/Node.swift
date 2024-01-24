//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Harry Ho on 1/24/24.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
