//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 세윤 on 2022/10/12.
//

import Foundation

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func push(data: T) {
        head = Node(data: data, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(data: T) {
        guard !isEmpty else {
            push(data: data)
            return
        }
        
        let node = Node(data: data)
        
        tail?.next = node
        tail = node
    }
    
    mutating func removeFirst() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
