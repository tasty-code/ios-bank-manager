//
//  File.swift
//  BankManagerConsoleApp
//
//  Created by 문성진 on 2022/10/12.
//

import Foundation

class Queue<T> {
    private var queue: LinkedList = LinkedList<T>()
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public func peek() -> T? {
        return queue.peek
    }
    
    public func clear() {
        queue.removeAll()
    }
    
    public func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public func dequeue() -> T? {
        return queue.removeLast()
    }
}
