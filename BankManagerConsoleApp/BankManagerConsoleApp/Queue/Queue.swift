//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 이은호 on 2022/10/13.
//

import Foundation

struct Queue<T> {
    
    var queue: LinkedList<T> = LinkedList<T>()
    var isEmpty: Bool {
        queue.isEmptyReturnTrue
    }
    var peek: T? {
        queue.returnFirstValue()
    }
    
    func enqueue(data: T) {
        queue.append(data: data)
    }
    
    func dequeue() -> T? {
        let returnValue = peek
        queue.removeFirst()
        return returnValue
    }
    
    func clear() {
        queue.removeAll()
    }
}
