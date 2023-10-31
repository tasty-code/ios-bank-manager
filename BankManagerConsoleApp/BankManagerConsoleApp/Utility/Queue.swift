//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by BOMBSGIE on 2023/10/31.
//

import Foundation


struct Queue<T> {
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        self.head == nil
    }
    
    mutating func enqueue(_ data: T) {
        if isEmpty {
            self.head = Node(data: data)
            self.tail = self.head
            return
        }
        
        self.tail?.nextNode = Node(data: data)
        self.tail = self.tail?.nextNode
    }
    
    mutating func dequeue() -> T? {
        let data = self.head?.data
        
        guard let newHead = head?.nextNode else {
            self.clear()
            return data
        }
        
        self.head = newHead
        return data
    }
    
    mutating func clear() {
        self.head = nil
        self.tail = nil
    }
    
    func peek() -> T? {
        return head?.data
    }
}

extension Queue {
    private class Node {
        var data: T
        var nextNode: Node?
        
        init(data: T) {
            self.data = data
            self.nextNode = nil
        }
    }
}

extension Queue {
    func fetchQueue() -> [T]? {
        var array = [T]()
        if isEmpty {
            return nil
        }
        
        var pointer = head
        
        while let next = pointer {
            array.append(next.data)
            pointer = next.nextNode
        }
        return array
    }
}
