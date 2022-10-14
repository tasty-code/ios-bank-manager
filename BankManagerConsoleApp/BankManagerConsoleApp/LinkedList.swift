//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 문성진 on 2022/10/12.
//

import Foundation

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var firstValue: T? {
        return head?.value
    }
    
    private mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: T) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    mutating func removeFirst() -> T? {
        guard head != nil else {
            return nil
        }
        
        let node = self.head
        self.head = head?.next

        return node?.value
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
