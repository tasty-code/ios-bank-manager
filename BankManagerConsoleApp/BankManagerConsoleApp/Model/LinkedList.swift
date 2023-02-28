//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 박재우 on 2023/02/21.
//

import Foundation

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil && tail == nil
    }
    var peek: T? {
        return head?.value
    }

    func append(_ value: T) {
        guard head != nil else {
            head = Node(value: value)
            tail = head
            return
        }
        let newNode = Node(value: value)
        tail?.next = newNode
        tail = newNode
    }

    func removeFirst() -> T? {
        guard let node = head else {
            return nil
        }
        head = node.next
        if head == nil {
            tail = nil
        }
        return node.value
    }

    func removeAll() {
        head = nil
        tail = nil
    }
}

class Node<T> {
    var value: T
    var next: Node<T>?

    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}
