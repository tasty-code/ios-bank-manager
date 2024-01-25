//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 루피, 진 on 1/24/24.
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
