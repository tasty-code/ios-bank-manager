//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/21.
//

import Foundation

final class LinkedList<T> {
    
    //MARK: - Properties
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return self.head == nil
    }
    
    //MARK: - Methodes
    
    func append(_ item: T) {
        let newItem = Node(value: item)
        
        if isEmpty {
            self.head = newItem
            self.tail = self.head
            return
        }
        self.tail?.next = newItem
        self.tail = newItem
    }
    
    func removeFirst() -> T? {
        let result = self.head?.value
        self.head = self.head?.next
        
        return result
    }
    
    func removeAll() {
        return self.head = nil
    }
    
    func showFirst() -> T? {
        return self.head?.value
    }
}
