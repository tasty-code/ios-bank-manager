//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/22.
//

import Foundation

actor Queue<T> {
    
    private var queue: LinkedList<T>
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    init(queue: LinkedList<T> = LinkedList<T>()) {
        self.queue = queue
    }
}

// MARK: - Methods
extension Queue {
    
    func enqueue(_ element: T) {
        queue.append(element)
    }
    
    func dequeue() -> T? {
        return queue.removeFirst()
    }
    
    func clear() {
        queue.removeAll()
    }

    func peek() -> T? {
        return queue.first
    }
}
