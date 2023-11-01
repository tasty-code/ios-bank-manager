//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/1/23.
//

import Foundation

fileprivate final class Node<T> {
    let data: T
    var next: Node<T>?
    
    init(data: T) {
        self.data = data
    }
}

final class Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    func enqueue(_ data: T) {
        let newNode = Node(data: data)
        
        guard !isEmpty else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = tail?.next
    }
    
    func dequeue() -> T? {
        guard let headNode = head else { return nil }
        
        let currentNode = headNode
        head = currentNode.next

        if head == nil {
            tail = nil
        }
        
        return currentNode.data
    }
    
    func peek() -> T? {
        guard let headNode = head else { return nil }
        return headNode.data
    }
   
    func clear() {
        head = nil
        tail = nil
    }
}
