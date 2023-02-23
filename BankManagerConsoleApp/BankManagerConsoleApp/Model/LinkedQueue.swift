//
//  LinkedQueue.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/21.
//

import Foundation

struct LinkedQueue<Value> {

    private var nodes = LinkedList<Value>()

    mutating func enqueue(data: Value) { nodes.append(data) }

    mutating func dequeue() -> Value? { nodes.removeFirst() }

    mutating func clear() {
        guard nodes.head != nil else { return }

        nodes.head = nil
        nodes.tail = nil
    }

    func peek() -> Value? { nodes.peek() }

    func isEmpty() -> Bool { nodes.head == nil ? true : false }
}
