//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/22.
//

import Foundation

protocol Workable {

    static var processingTime: Double { get }

    func work(for currentCustomerNumber: Int)
}

extension Workable {

    func work(for currentCustomerNumber: Int) {
        print(Message.workStart(currentCustomerNumber))
        Thread.sleep(forTimeInterval: Banker.processingTime)
        print(Message.workComplete(currentCustomerNumber))
    }
}

