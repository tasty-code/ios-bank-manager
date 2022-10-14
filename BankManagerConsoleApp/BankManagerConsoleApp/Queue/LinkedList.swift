//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 이은호 on 2022/10/12.
//

import Foundation

final class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    var returnFirstValue: T? {
        head?.data
    }
    
    func addLast(data: T) {
        if isEmpty {
            head = Node(data: data)
            tail = head
            return
        }
        
        let newNode = Node(data: data)
        tail?.next = newNode
        tail = newNode
    }
    
    func removeFirst() -> T? {
        if isEmpty { return nil }
        
        let returnValue = head?.data
        head = head?.next
        
        return returnValue
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}
