//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by MAC2020 on 2024/01/23.
//

import Foundation

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    func appendLastNode(data: T) {
        let newNode = Node(value: data)
        if head == nil || tail == nil {
            head = newNode
            tail = head
            return
        }
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    func removeFirstNode() -> T? {
        if head == nil || tail == nil {
            tail = nil
            return nil
        }
        let deleteNode = head
        head = deleteNode?.next
        head?.prev = nil
        return deleteNode?.value
    }
    
    func peekNode() -> T? {
        return head?.value
    }
    func isEmpty() -> Bool {
        return head?.value == nil && tail?.value == nil
    }
}
