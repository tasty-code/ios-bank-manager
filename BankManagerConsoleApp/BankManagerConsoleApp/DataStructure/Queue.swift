//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by devxsby on 2023/02/21.
//

import Foundation

struct Queue<Value: Equatable> {
    private var queue: LinkedList = LinkedList<Value>()
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func euqueue(_ item: Value) {
        queue.append(item)
    }
    
    mutating func dequeue() -> Value? {
        return queue.pop()
    }
    
    mutating func peek() -> Value? {
        return queue.first
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
