//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

struct Queue<T> {
    private var front: Node<T>?
    private var rear: Node<T>?
    
    mutating func enqueue(_ value: T) {
        
        let newNode = Node(value: value)
        
        if isEmpty() {
            front = newNode
            rear = newNode
        } else {
            rear?.next = newNode
            rear = newNode
        }
    }
    
    mutating func dequeue() -> T? {
        guard let currentFront = front else {
            return nil
        }
        front = currentFront.next
        if front == nil {
            rear = nil
        }
        return currentFront.value
    }
    
    func peek() -> T? {
        return front?.value
    }
    
    func isEmpty() -> Bool {
        return front == nil
    }
    
    mutating func clear() {
        front = nil
        rear = nil
    }
}
