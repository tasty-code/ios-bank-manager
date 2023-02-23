//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by Jason on 2023/02/23.
//

import Foundation

struct Teller: Workable {
    var identifier: String
    private(set) var customerLinkedList = Queue<Int>()
    
    mutating func working(responsibility: Int) {
        customerLinkedList.euqueue(responsibility)
    }
    
    mutating func finishing() -> Int {
        guard let finishCustomNumber = customerLinkedList.dequeue() else {
            return 0
        }
        return finishCustomNumber
    }
}
