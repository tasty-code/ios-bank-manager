//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by yujaehong on 1/31/24.
//

import Foundation

class Queue<T> {
    var linkedList: LinkedList<T>
    
    init(linkedList: LinkedList<T> = LinkedList()) {
        self.linkedList = linkedList
    }
}

extension Queue {
    func enqueue(_ value: T) {
        linkedList.append(value)
    }
    
    func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> T? {
        return linkedList.first
    }
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty
    }
}
