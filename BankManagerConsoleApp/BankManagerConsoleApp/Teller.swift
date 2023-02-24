//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by Jason on 2023/02/23.
//

import Foundation

struct Teller: Workable {
    var identifier: String = ""
    private(set) var customerQueue = Queue<Int>()
    
    mutating func working(responsibility: Int) {
        customerQueue.euqueue(responsibility)
    }
    
    mutating func finishing() -> Int? {
        guard let finishCustomNumber = customerQueue.dequeue() else { return nil }
        return finishCustomNumber
    }
}
