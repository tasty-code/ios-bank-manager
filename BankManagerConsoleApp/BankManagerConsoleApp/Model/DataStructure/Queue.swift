//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Mason Kim on 2023/02/22.
//

import Foundation

struct Queue<Value> {
    private var linkedList = LinkedList<Value>()

    var peek: Value? {
        return linkedList.headValue
    }

    var isEmpty: Bool {
        return linkedList.isEmpty
    }

    var count: Int {
        return linkedList.count
    }

    mutating func enqueue(_ value: Value) {
        linkedList.append(value)
    }

    @discardableResult
    mutating func dequeue() -> Value? {
        linkedList.removeFirst()
    }

    mutating func clear() {
        linkedList.removeAll()
    }
}
