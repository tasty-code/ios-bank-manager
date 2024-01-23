//
//  BankTellerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/23/24.
//

import Foundation

struct BankTellerQueue<Element> {
    private var linkedList = LinkedList<Element>()
        
    mutating func enqueue(item: Element) {
        linkedList.append(item: item)
    }
    
    mutating func dequeue() -> Element? {
        linkedList.remove()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> Element? {
        linkedList.head?.data
    }
    
    func isEmpty() -> Bool {
        linkedList.isEmpty
    }
}
