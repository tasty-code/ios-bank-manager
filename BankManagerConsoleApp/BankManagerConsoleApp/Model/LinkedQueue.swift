//
//  LinkedQueue.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/21.
//

import Foundation

struct LinkedQueue<Value> {

    private var nodes = LinkedList<Value>()
    var front: Node<Value>? { nodes.head }
    var rear: Node<Value>? { nodes.tail }
    var count: Int { nodes.count }

    mutating func enqueue(data: Value) {
        nodes.append(data)
    }

    mutating func dequeue() -> Value? {
        nodes.removeFirst()
    }

    mutating func clear() {
        guard nodes.count != 0 else { return }

        nodes.head = nil
        nodes.tail = nil
        nodes.count = 0
    }

    func peek() -> Value? { nodes.peek() }

    func isEmpty() -> Bool {
        guard nodes.count == 0 else { return false }

        return true
    }
}
