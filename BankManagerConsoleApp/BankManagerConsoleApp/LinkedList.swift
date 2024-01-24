//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by MAC2020 on 2024/01/23.
//

import Foundation

class LinkedList<T> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func appendLastNode(data: T) {
        let newNode = Node(value: data)
        if head == nil || tail == nil {
            head = newNode
            tail = head
            return
        }
        tail?.formNext(newNode)
        newNode.formPrev(tail)
        tail = newNode
    }
    
    @discardableResult
    func removeFirstNode() -> T? {
        if head == nil || tail == nil {
            tail = nil
            return nil
        }
        let deleteNode = head
        head = deleteNode?.fetchNext()
        head?.formPrev(nil)
        
        tail = isEmpty() ? head : tail
        return deleteNode?.fetchValue()
    }
    
    func peekNode() -> T? {
        return head?.fetchValue()
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    
}
