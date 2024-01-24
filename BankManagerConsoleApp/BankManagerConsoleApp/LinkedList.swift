//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Harry Ho on 1/24/24.
//

import Foundation

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var count: Int = 0
    
    var isEmpty: Bool {
        head == nil
    }
    
    func push(with data: T) {
        head = Node(data: data, next: head)
        count += 1
        if tail == nil {
            tail = head
        }
    }
    
    func append(with data: T) {
        guard isEmpty == false else {
            push(with: data)
            return
        }
        
        tail?.next = Node(data: data)
        count += 1
        tail = tail?.next
    }
}
