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

class LinkedList<Value> {

    var head: Node<Value>?
    var tail: Node<Value>?

    func append(_ data: Value) {
        let newNode = Node(data: data)

        if head == nil {
            head = newNode
            tail = head

            return
        }

        tail?.next = newNode
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
