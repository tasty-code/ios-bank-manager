//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Harry Ho on 1/24/24.
//

import Foundation

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var count: Int = 0
    
    var isEmpty: Bool {
        head == nil
    }
}
