//
//  LinkedQueue.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/21.
//

import Foundation

struct LinkedQueue<T> {

    private var queue = LinkedList<T>()

    mutating func enqueue(data: T) {
        queue.append(data)
    }

    mutating func dequeue() {
        let dequeueData = queue.removeFirst()
    }

    mutating func clear() {
        guard queue.count != 0 else { return }

        self.queue.head = nil
        self.queue.tail = nil
    }

    func peek() -> T? {
        guard let firstNode = queue.head else { return nil }

        return firstNode.data
    }

    func isEmpty() -> Bool {
        guard queue.count == 0 else { return false }

        return true
    }
}
