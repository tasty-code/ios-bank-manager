//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 세윤 on 2022/10/14.
//

import Foundation

struct Queue<T> {
    var queue: LinkedList<T> = LinkedList<T>()
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    
    var peek: T? {
        queue.peek
    }
    
    mutating func enqueue(_ item: T) {
        queue.append(data: item)
    }
    
    mutating func dequeue() -> T? {
        queue.removeFirst()
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
