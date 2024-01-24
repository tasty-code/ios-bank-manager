//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Harry Ho on 1/24/24.
//

import Foundation

class Queue<T> {
    var queue: LinkedList<T> = LinkedList()
    
    func enqueue(with item: T) {
        queue.append(with: item)
    }
    
    func dequeue() -> T? {
        return queue.pop()
    }
    
    func clean() {
        queue.clean()
    }
    
    func peek() -> T? {
        return queue.peek()
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    func totalLength() -> Int {
        return queue.count
    }
}
