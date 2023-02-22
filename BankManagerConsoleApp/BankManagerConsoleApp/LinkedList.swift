//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/22.
//

import Foundation

final class Node<Value> {
    var value: Value
    var next: Node?

    init(_ value: Value) {
        self.value = value
    }
}

final class LinkedList<Value> {
    private var head: Node<Value>?
    private var tail: Node<Value>?

    var isEmpty: Bool {
        head == nil
    }

    func append(_ value: Value) {
        guard !isEmpty else {
            head = Node(value)
            tail = head
            return
        }

        tail?.next = Node(value)
        tail = tail?.next
    }
}
