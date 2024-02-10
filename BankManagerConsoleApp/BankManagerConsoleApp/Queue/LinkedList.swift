//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by yujaehong on 1/31/24.
//

final class LinkedList<T> {
    var front: Node<T>?
    var rear: Node<T>?
    
    init(front: Node<T>? = nil, rear: Node<T>? = nil) {
        self.front = front
        self.rear = rear
    }
    
    var first: T? {
        return front?.value
    }
    
    var isEmpty: Bool {
        return front == nil
    }
}

extension LinkedList {
    func append(_ value: T) {
        let newNode = Node(value)
        
        if isEmpty {
            front = newNode
            rear = front
        } else {
            rear?.next = newNode
            rear = newNode
        }
    }
    
    func removeFirst() -> T? {
        if front === rear {
            let result = front
            front = nil
            rear = nil
            return result?.value
        }
        guard let currentFront = front else { return nil }
        front = front?.next
        return currentFront.value
    }
    
    func removeAll() {
        front = nil
        rear = nil
    }
}


