//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 신동오 on 2023/02/21.
//

import Foundation

struct Queue<T> {
    private var list = LinkedList<T>()
    
    mutating func enqueue(_ value: T) {
        list.append(value)
    }
    
    mutating func dequeue() -> T? {
        return list.removeFirst()
    }
    
    mutating func clear() {
        list.clear()
    }
    
    func peek() -> T? {
        return list.peek
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}
