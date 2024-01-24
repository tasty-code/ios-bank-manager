//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 둘리 on 2024/01/24.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
