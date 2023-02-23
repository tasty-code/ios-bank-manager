//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let queue = Queue<String>()
let clerk = BankClerk()
var bank = Bank(queue: queue, clerk: clerk)

print("""
        1:은행개점
        2:종료
        """)
print("입력: ", terminator: "")
var chosenMenu = readLine()!

while chosenMenu != String(2) {
    let numberOfCustomers = randomNumberOfCustomers()
    
    bank.receive(numberOfCustomers: numberOfCustomers)
    bank.lineUpCustomersInQueue()
    bank.handleAllCustomers()
    print("""
            1:은행개점
            2:종료
            """)
    print("입력: ", terminator: "")
    chosenMenu = readLine()!
}

