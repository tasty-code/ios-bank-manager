//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 이은호 on 2022/10/13.
//

import Foundation

struct Queue<T> {
    private var queueList = LinkedList<T>()
    
    var count: Int {
        queueList.count
    }
    
    var isEmpty: Bool {
        queueList.isEmpty
    }
    
    var peek: T? {
        queueList.returnFirstValue
    }
    
    func enqueue(data: T) {
        queueList.addLast(data: data)
    }
    
    func dequeue() -> T? {
        queueList.removeFirst()
    }
    
    func clear() {
        queueList.removeAll()
    }
}
