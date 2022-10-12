//
//  File.swift
//  BankManagerConsoleApp
//
//  Created by 문성진 on 2022/10/12.
//

import Foundation

struct Queue<T> {
    private var queue: [T] = []
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public func peek() -> T? {
        return queue.first
    }
    
    public mutating func clear() {
        queue.removeAll()
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return queue.removeFirst()
    }
}
