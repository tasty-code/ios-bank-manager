//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 이은호 on 2022/10/12.
//

import Foundation

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    func append(data: T?) {
        if head == nil || tail == nil {
            head = Node.init(data: data)
            tail = head
            return
        }
        
        let newNode = Node.init(data: data)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    func removeFirst() {
        if head == nil || tail == nil { return }
        
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        
        head?.next?.prev = head?.prev
        head = head?.next
    }
    
    
}




