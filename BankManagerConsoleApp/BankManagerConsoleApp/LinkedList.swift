//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/22.
//

import Foundation

final class Node<T> {
    var data: T
    var next: Node?
    
    init(_ data: T, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    deinit { print("Node has been deinitialized.") }
}

final class LinkedList<T> {
    
    private var head: Node<T>?
    
    var isEmpty: Bool  {
        return head == nil ? true : false
    }
}

// MARK: - Methods
extension LinkedList {
    
    /// Add    
    func addBack(_ data: T) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head
        
        while(node?.next != nil) {
            node = node?.next
        }
        node?.next = newNode
    }
    
    /// Get
    func getFirst() -> T? {
        return head?.data
    }

    /// Remove
    func removeFirst() {
        head = head?.next
    }
            
    func removeAll() {
        head = nil
    }
}
