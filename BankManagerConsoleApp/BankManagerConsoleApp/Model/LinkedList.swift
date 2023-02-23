//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/21.
//

import Foundation

final class Node<Value> {

    fileprivate var value: Value
    var next: Node?

    init(data: Value, next: Node? = nil) {
        self.value = data
        self.next = next
    }
}

struct LinkedList<Value> {

    var head: Node<Value>?
    var tail: Node<Value>?
    var count = 0

    mutating func append(_ data: Value) {
        let newNode = Node(data: data)

        count += 1

        if head == nil {
            head = newNode
            tail = head

            return
        }

        tail?.next = newNode
        tail = newNode
    }

    mutating func removeFirst() -> Value? {
        guard count != 0 else { return nil }

        let removedValue = head?.value

        if head?.next != nil {
            head = head?.next
            count -= 1
        } else {
            head = nil
            tail = nil
            count = 0
        }

        return removedValue
    }

    func peek() -> Value? { head != nil ? head?.value: nil }
}
