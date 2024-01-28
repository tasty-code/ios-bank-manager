//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Roh on 1/28/24.
//

struct Bank {
    var bankTellerQueue = BankTellerQueue<Customer>()
    
    mutating func setWaitingLine(customer: Customer) {
        for numbers in 1...customer.number {
            bankTellerQueue.enqueue(item: customer)
        }
    }
    
    mutating func endWaitingLine() {
        let myTurn = bankTellerQueue.dequeue()
        let bankClerk = BankClerk(next: myTurn)
    }
    
    func isClosingBank() -> Bool {
        // 프롬포트에 2번 누르고, 큐에 맴버가 없을때
        if true {
            return true
        }
        return false
    }
    
    
}
