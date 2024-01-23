//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Kim EenSung on 1/23/24.
//

import Foundation

class Node<T: Equatable> {
    private let value: T
    private var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node {
    public func getValue() -> T {
        return value
    }
    
    public func getNext() -> Node? {
        return next
    }
    
    public func changeNext(to node: Node?) {
        next = node
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.getValue() == rhs.getValue()
    }
}

class LinkedList<T: Equatable> {
    private var head: Node<T>?
    private var _count: Int
    var count: Int {
        return _count
    }
    
    init(head: Node<T>? = nil) {
        self.head = head
        self._count = head == nil ? 0 : 1
    }
}

extension LinkedList {
    public func getNode(index: Int) -> Node<T>? {
        if index < 0 || index > _count {
            fatalError("Index out of range")
        }
        
        if index == 0 {
            return head
        }
        
        var nextNode: Node<T>? = head

        for _ in 1...index {
            guard let next = nextNode?.getNext() else {
                return nil
            }
            nextNode = next
        }
        return nextNode
    }
    
    public func getReferenceNode(_ node: Node<T>) -> Node<T>? {
        if let reference = head?.getNext(), reference == node {
            return head
        }
        
        var nextNode = head?.getNext()
            
        for _ in 1..._count {
            if let reference = nextNode?.getNext(), reference == node {
                return nextNode
            }
            nextNode = nextNode?.getNext()
        }
        
        return nil
    }
    
    public func addNode(_ node: Node<T>) {
        let lastNode = getNode(index: _count - 1)
        lastNode?.changeNext(to: node)
        _count += 1
    }
    
    public func addNode(_ node: Node<T>, after: Node<T>) {
        if let temporaryNode = after.getNext() {
            node.changeNext(to: temporaryNode)
        }
        
        after.changeNext(to: node)
        _count += 1
    }
    
    public func removeNode(_ node: Node<T>) {
        let previousNode = getReferenceNode(node)
        
        if let nextNode = node.getNext() {
            previousNode?.changeNext(to: nextNode)
        } else {
            previousNode?.changeNext(to: nil)
        }
      
        _count -= 1
    }
}
