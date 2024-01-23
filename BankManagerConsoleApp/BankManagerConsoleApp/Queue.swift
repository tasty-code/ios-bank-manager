//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/22.
//

import Foundation

struct Queue<T> {
    private var queue: LinkedList<T>
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
}

// MARK: - Methods
extension Queue {
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        return queue.removeFirst()
    }
    
    mutating func clear() {
        queue.removeAll()
    }

    mutating func peek() -> T? {
        return queue.getFirst()
    }
}
