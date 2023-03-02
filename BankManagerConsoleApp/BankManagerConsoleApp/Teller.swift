//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by Jason on 2023/02/23.
//

import Foundation

final class Teller: Workable {
    var identifier: String = ""
    private(set) var customerQueue = Queue<Int>()
    
    func working(responsibility: Int) {
        customerQueue.euqueue(responsibility)
    }
    
    func finishing() -> Int? {
        guard let finishCustomNumber = customerQueue.dequeue() else { return nil }
        return finishCustomNumber
    }
}
