//
//  File.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/11.
//

import Foundation

struct Queue<Type> {
    private var linkedList: LinkedList<Type> = LinkedList<Type>()
    
    var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    var peek: Type? {
        isEmpty ? nil : linkedList.peek
    }
    
    mutating func enqueue(_ element: Type) {
        linkedList.append(element)
    }
    
    mutating func dequeue() -> Type? {
        isEmpty ? nil : linkedList.removeFirst()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
}
