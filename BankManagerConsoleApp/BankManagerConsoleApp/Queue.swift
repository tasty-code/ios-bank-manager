//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 신동오 on 2023/02/21.
//

import Foundation

struct Queue<T> {
    private var list = LinkedList<T>()
    
    func enqueue(_ value: T) {
        list.append(value)
    }
    
    @discardableResult
    func dequeue() -> T? {
        return list.removeFirst()
    }
    
    func clear() {
        list.removeAll()
    }
    
    func peek() -> T? {
        return list.peek
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}
