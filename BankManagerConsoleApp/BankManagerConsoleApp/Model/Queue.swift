//
//  File.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/11.
//

import Foundation

struct Queue<T> {
    private var linkedList: LinkedList<T> = LinkedList<T>()

    var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    var peek: T? {
        isEmpty ? nil : linkedList.peek
    }
    
    mutating func enqueue(_ element: T) {
        linkedList.append(element)
    }
    
    mutating func dequeue() -> T? {
        isEmpty ? nil : linkedList.removeFirst()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
}
