//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/21.
//

import Foundation

final class Node<T> {

    var data: T
    var next: Node?

    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T> {

    var head: Node<T>?
    var tail: Node<T>?
    var count = 0

    mutating func append(_ data: T) {
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

    mutating func removeFirst() -> T? {
        guard count != 0 else { return nil }

        let removedValue = head?.data

        head = head?.next

        if head == nil {
            tail = nil
            count = 0
        } else {
            count -= 1
        }

        return removedValue
    }
}
