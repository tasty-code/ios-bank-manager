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
    
    func push(_ data: T) {
        head = Node(data: data, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    func append(data: T) {
        guard !isEmpty else {
            push(data)
            return
        }
        tail?.next = Node(data: data)
        tail = tail?.next
    }
    
    func pop() -> T? {
        let excludeData = head?.data
        head = head?.next
        
        if isEmpty {
            tail = nil
        }
        return excludeData
    }
    
    func removaLast() -> T? {
        
    }
    
    func insert(data: T) {
        
    }
    
    func removeAll() {
        
    }
}
