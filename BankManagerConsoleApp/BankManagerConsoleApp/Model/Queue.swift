//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/23/24.
//

import Foundation

class Queue<Element> {
    let linkedList = LinkedList<Element>()
    func enqueue(item: Element) {
        linkedList.append(item: item)
    }
    
    func dequeue() -> Element? {
        linkedList.remove()
    }
    
    func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> Element? {
        linkedList.head?.data
    }
    
    func isEmpty() -> Bool {
        linkedList.isEmpty
    }
}
