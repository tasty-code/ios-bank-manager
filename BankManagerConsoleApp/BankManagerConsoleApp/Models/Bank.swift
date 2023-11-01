//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 김경록 on 11/1/23.
//

import Foundation

struct Bank {
    let waitingList = Queue<Customer>()
    var isOpen: Bool = false
}
