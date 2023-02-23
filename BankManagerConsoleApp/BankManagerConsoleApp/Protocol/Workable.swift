//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/22.
//

import Foundation

protocol Workable {

    static var processingTime: Double { get }

    func work(for who: Customer)
}

extension Workable {

    func work(for who: Customer) {
        
    }
}
