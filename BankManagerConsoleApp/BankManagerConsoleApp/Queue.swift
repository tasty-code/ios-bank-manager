//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 둘리 on 2024/01/24.
//

import Foundation

struct Queue<T> {
    var queue: LinkedList = LinkedList<T>()
    
    func enqueue(element: T) {
        queue.append(value: element)
    }
    
    func dequeue() -> T? {
        queue.removeFirst()
    }
    
    func isEmpty() -> Bool {
        queue.isEmpty()
    }
    
    func peek() -> T? {
        queue.peek()
    }
    
    func clear() {
        queue.clear()
    }
}
