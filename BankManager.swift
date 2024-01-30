//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    var isOpen: Bool = true
    var ticketMachine = Queue<Customer>()
    var customers: [Customer] = []
    
    func printMenuOfBank() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    mutating func operateBank() {
        while isOpen {
            resetCustomer()
            printMenuOfBank()
            guard let input = selectBankingOperation() else { return }
            executeBankingOperation(of: input)
        }
    }
    
    mutating func executeBankingOperation(of input: String) {
        switch input {
        case "1": 
            print("은행개점")
            createCustomer()
            print("\(customers.count) 명의 고객이 생성되었다.")
        case "2":
            print("은행종료")
            isOpen = false
        default:
            break
        }
    }
    
    func selectBankingOperation() -> String? {
        guard let input = readLine() else { return nil }
        return input
    }
    
    mutating func createCustomer() {
        let number = Int.random(in: 1...5)
        for ticketNumber in 1...number {
            customers.append(Customer(ticketNumber: ticketNumber))
        }
    }
    
    mutating func resetCustomer() {
        customers = []
    }
}
