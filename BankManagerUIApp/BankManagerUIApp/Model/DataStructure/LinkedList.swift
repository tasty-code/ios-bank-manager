//
//  LinkedList.swift
//  BankManagerUIApp
//
//  Created by Mason Kim on 2023/03/09.
//

import Foundation

final class Node<Value> {
    var value: Value
    var next: Node?

    init(_ value: Value) {
        self.value = value
    }
}

struct LinkedList<Value> {
    private var head: Node<Value>?
    private var tail: Node<Value>?

    var isEmpty: Bool {
        return head == nil
    }

    var headValue: Value? {
        return head?.value
    }

    var count: Int {
        guard var node = head else {
            return 0
        }

        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }

        return count
    }

    mutating func append(_ value: Value) {
        guard !isEmpty else {
            head = Node(value)
            tail = head
            return
        }

        tail?.next = Node(value)
        tail = tail?.next
    }

    @discardableResult
    mutating func removeFirst() -> Value? {
        let headValue = head?.value
        head = head?.next

        if isEmpty {
            tail = nil
        }

        return headValue
    }

    mutating func removeAll() {
        head = nil
    }
}
