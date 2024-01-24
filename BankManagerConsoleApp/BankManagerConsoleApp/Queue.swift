//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Matthew on 1/23/24.
//

import Foundation

class Queue<T> {
    let likeList = LinkedList<T>()
    
    func enqueue(data: T) {
        likeList.appendLastNode(data: data)
    }
    
    func dequeue() -> T? {
        return likeList.removeFirstNode()
    }
    
    func clear() {
        while likeList.removeFirstNode() != nil {
            likeList.removeFirstNode()
        }
    }
    
    func peek() -> T? {
        return likeList.peekNode()
    }
    
    func isEmpty() -> Bool {
        return likeList.isEmpty()
    }
}
