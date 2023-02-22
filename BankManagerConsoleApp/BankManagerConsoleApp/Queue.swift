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
        return linkedList.peek
    }

    var isEmpty: Bool {
        return linkedList.isEmpty
    }

    mutating func enqueue(_ value: Value) {
        linkedList.append(value)
    }

    mutating func dequeue() -> Value? {
        linkedList.removeFirst()
    }

    mutating func clear() {
        linkedList.removeAll()
    }
}
