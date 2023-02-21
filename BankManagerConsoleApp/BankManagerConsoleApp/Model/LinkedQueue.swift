//
//  LinkedQueue.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/21.
//

import Foundation

struct LinkedQueue<T> {

    private var nodes = LinkedList<T>()
    var front: Node<T>? { nodes.head }
    var rear: Node<T>? { nodes.tail }
    var count: Int { nodes.count }

    mutating func enqueue(data: T) {
        nodes.append(data)
    }

    mutating func dequeue() -> T? {
        nodes.removeFirst()
    }

    mutating func clear() {
        guard nodes.count != 0 else { return }

        nodes.head = nil
        nodes.tail = nil
        nodes.count = 0
    }

    func peek() -> T? {
        guard let firstNode = nodes.head else { return nil }

        return firstNode.data
    }

    func isEmpty() -> Bool {
        guard nodes.count == 0 else { return false }

        return true
    }
}
