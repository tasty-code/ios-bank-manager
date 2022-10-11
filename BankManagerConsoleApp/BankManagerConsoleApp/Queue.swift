//
//  File.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/11.
//

import Foundation

struct Queue<T> {
    private var queue: [T] = []
    
    var count: Int {
        queue.count
    }
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    
    var peek: T? {
        isEmpty ? nil : queue.first
    }
    
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        isEmpty ? nil : queue.removeFirst()
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
