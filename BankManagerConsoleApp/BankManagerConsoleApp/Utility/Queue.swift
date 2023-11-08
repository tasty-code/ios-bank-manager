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
    
    var peek: T? {
        self.head?.data
    }
    
    mutating func enqueue(_ data: T) {
        if self.isEmpty {
            self.head = Node(data: data)
            self.tail = self.head
            return
        }
        
        self.tail?.nextNode = Node(data: data)
        self.tail = self.tail?.nextNode
    }
    
    mutating func dequeue() -> T? {
        let data = self.head?.data
        
        guard let newHead = self.head?.nextNode else {
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
 
}

extension Queue {
    private final class Node {
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
        if self.isEmpty {
            return nil
        }
        
        var pointer = self.head
        
        while let next = pointer {
            array.append(next.data)
            pointer = next.nextNode
        }
        return array
    }
}
