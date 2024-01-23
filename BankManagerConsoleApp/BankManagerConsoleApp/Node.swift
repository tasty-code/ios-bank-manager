//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Kim EenSung on 1/23/24.
//

import Foundation

class Node<T: Equatable> {
    private let _value: T
    var value: T {
        return _value
    }
    
    private var _next: Node?
    var next: Node? {
        get {
            return _next
        }
        set(node) {
           _next = node
        }
    }
    
    init(value: T, next: Node? = nil) {
        self._value = value
        self._next = next
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
