//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by nayeon  on 2024/01/23.
//

import Foundation

final class LinkedList<Element> {
    private(set) var head: Node<Element>?
    private(set) var tail: Node<Element>?
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        head == nil
    }

    func append(new item: Element) {
        let newNode = Node(data: item)
        
        guard let node = tail else {
            head = newNode
            tail = newNode
            count = 1
            return
        }
        node.next = newNode
        tail = newNode
        count += 1
    }
    
    func prepend(item: Element) {
        let newNode = Node(data: item)
        
        guard let currentHead = head else {
            head = newNode
            tail = newNode
            count = 1
            return
        }
        
        newNode.next = currentHead
        head = newNode
        count += 1
    }
    
    func removeFirst() -> Element? {
        let removeNodeValue = head?.data
        
        head = head?.next
        if isEmpty {
            tail = head
        }
        count -= 1
        
        return removeNodeValue
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    func insert(value: Element, index: Int) {
        let newNode = Node(data: value)
        
        if index >= count || isEmpty {
            append(new: value)
            return
        } else if index == 0 {
            prepend(item: value)
            return
        }
        
        let serchNode = serch(index: index)
        newNode.next = serchNode?.next
        serchNode?.next = newNode
        count += 1
    }
    
    func remove(at index: Int) -> Element? {
        guard !isEmpty, index >= 0 else { return nil }
        
        if index == 0 {
            return removeFirst()
        } 
       
        let prevNode = serch(index: index)
        let removeNode = prevNode?.next
        prevNode?.next = removeNode?.next
        count -= 1
        
        return removeNode?.data
    }
    
    private func serch(index: Int) -> Node<Element>? {
        var indexNode = head
        
        for _ in 1..<index - 1  {
            indexNode = indexNode?.next
        }
        return indexNode
    }
}

