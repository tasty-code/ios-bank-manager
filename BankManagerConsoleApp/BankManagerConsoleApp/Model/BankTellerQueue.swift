//
//  BankTellerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/23/24.
//

import Foundation

struct BankTellerQueue<Element> {
    private var linkedList = LinkedList<Element>()
    
    var count: Int {
        linkedList.count
    }
        
    mutating func enqueue(item: Element) {
        linkedList.append(item: item)
    }
    
    mutating func dequeue() -> Element? {
        linkedList.removeFirst()
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
