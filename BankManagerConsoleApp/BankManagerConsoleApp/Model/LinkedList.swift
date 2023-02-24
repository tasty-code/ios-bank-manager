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

    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<Value> {

    var head: Node<Value>?
    var tail: Node<Value>?

    func append(_ value: Value) {
        let newNode = Node(value: value)

        if head == nil {
            head = newNode
            tail = head

            return
        }

        head?.next = newNode
        tail = newNode
    }

    func removeFirst() -> Value? {
        guard head != nil else { return nil }

        let removedValue = head?.value

        if head?.next != nil {
            head = head?.next
        } else {
            head = nil
            tail = nil
        }

        return removedValue
    }

    func peek() -> Value? { head != nil ? head?.value: nil }
}
