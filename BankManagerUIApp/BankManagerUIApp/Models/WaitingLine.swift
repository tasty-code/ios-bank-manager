//
//  WaitingLine.swift
//  BankManagerUIApp
//
//  Created by Janine on 11/14/23.
//

import Foundation

final class WaitingLine {
    static let shared = WaitingLine()
    let waitingLine: Queue = Queue<Customer>()
    
    private init() {}
}
