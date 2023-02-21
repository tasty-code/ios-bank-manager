//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Jason on 2023/02/21.
//

import Foundation

class LinkedList<T> {
    private var head: Node<T>?
    
    func enqueue(data: T) {
        guard head == nil else {
            head = Node(data: data)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    func dequeue() {
        guard head == nil else { return }
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        node?.next = node?.next?.next
    }
}
