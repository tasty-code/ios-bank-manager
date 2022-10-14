//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 이은호 on 2022/10/12.
//

import Foundation

class Node<T> {
    var prev: Node?
    var data: T
    var next: Node?
    
    init(data: T, prev: Node? = nil, next: Node? = nil) {
        self.prev = prev
        self.data = data
        self.next = next
    }
}
