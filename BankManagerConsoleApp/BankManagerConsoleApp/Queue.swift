//
//  File.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/11.
//

import Foundation

struct Queue<Type> {
    private var queue: [Type] = []
    
    var count: Int {
        queue.count
    }
    
    var isEmpty: Bool {
        queue.isEmpty
    }
    
    var peek: Type? {
        isEmpty ? nil : queue.first
    }
    
    mutating func enqueue(_ element: Type) {
        queue.append(element)
    }
    
    mutating func dequeue() -> Type? {
        isEmpty ? nil : queue.removeFirst()
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}
