//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/11.
//

import Foundation

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    init() { }
    
    var peek: T? {
        head != nil ? head?.data : nil
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func append(_ element: T) {
        if isEmpty {
            head = Node(data: element)
            tail = head
        } else {
            let node = Node(data: element)
            tail?.next = node
            tail = node
        }
    }
    
    mutating func removeFirst() -> T? {
        guard !isEmpty else { return nil }
        
        let data = head?.data
        
        if head?.next != nil {
            head = head?.next
        } else {
            head = nil
        }
        
        return data
    }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}
