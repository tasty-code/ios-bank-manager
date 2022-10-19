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
    
    var count: Int = 0
    
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
            count += 1
            return
        }
        
        let newNode = Node(data: data)
        tail?.next = newNode
        tail = newNode
        count += 1
    }
    
    func removeFirst() -> T? {
        if isEmpty { return nil }
        
        let returnValue = head?.data
        head = head?.next
        count -= 1
        
        return returnValue
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}
