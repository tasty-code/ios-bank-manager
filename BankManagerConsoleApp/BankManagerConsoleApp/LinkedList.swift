//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Jason on 2023/02/21.
//

import Foundation

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    func push(_ value: T) {
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    func append(value: T) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    func pop() -> T? {
        let excludeData = head?.value
        head = head?.next
        
        if isEmpty {
            tail = nil
        }
        return excludeData
    }
    
    func removeLast() -> T? {
        
    }
    
    func insert(data: T) {
        
    }
    
    func removeAll() {
        
    }
}
