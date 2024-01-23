//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Kim EenSung on 1/23/24.
//

import Foundation

class Node<T: Equatable> {
    private let value: T
    private var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node {
    public func getValue() -> T {
        return value
    }
    
    public func getNext() -> Node? {
        return next
    }
    
    public func changeNext(to node: Node?) {
        next = node
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.getValue() == rhs.getValue()
    }
}
