//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/11.
//

import Foundation

struct LinkedList<Type> {
    var head: Node<Type>?
    var tail: Node<Type>?
    
    init() { }
    
    var peek: Type? {
        head != nil ? head?.data : nil
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func append(_ element: Type) {
        if isEmpty {
            head = Node(data: element)
            tail = head
        } else {
            let node = Node(data: element)
            tail?.next = node
            tail = node
        }
    }
    
    mutating func removeFirst() -> Type? {
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
