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

