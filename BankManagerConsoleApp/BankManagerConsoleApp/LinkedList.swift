//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/22.
//

import Foundation

struct LinkedList<T> {
    
    var head: Node<T>?
    var tail: Node<T>?
    
    var first: T? {
        return head?.data
    }
    
    var isEmpty: Bool  {
        return head == nil
    }
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }
}

// MARK: - Methods
extension LinkedList {
    
    mutating func append(_ data: T) {
        let newNode = Node(data)
        
        if isEmpty {
            head = newNode
            tail = head
            return
        }
        
        let currentTail = tail
        currentTail?.next = newNode
        tail = newNode
    }

    mutating func removeFirst() -> T? {
        let currentHead = head
        head = head?.next
        return currentHead?.data
    }
            
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
