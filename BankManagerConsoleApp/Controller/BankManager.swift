//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    var isOpen: Bool = true
    var employees: [Employee] = []
    var customerManager = CustomerManager()
    var totalTaskTime: Double { Double(customerManager.customers.count * 700) / 1000 }
    
    func printMenuOfBank() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    func printCloseMenu() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerManager.customers.count)명이며, 총 업무시간은 \(totalTaskTime)초 입니다.")
    }
    
    mutating func operateBank() {
        while isOpen {
            customerManager.resetCustomer()
            printMenuOfBank()
            do {
                let input = try selectBankingOperation()
                executeBankingOperation(of: input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    mutating func executeBankingOperation(of input: String) {
        switch input {
        case "1":
            customerManager.createCustomer()
            customerManager.registerCustomer(with: customerManager.customers)
            employees.append(Employee())
            employees[0].handleCustomerTasks(with: customerManager.ticketMachine)
            printCloseMenu()
        case "2":
            print("은행종료")
            isOpen = false
        default:
            break
        }
    }
    
    func selectBankingOperation() throws -> String {
        guard let input = readLine() else {
            throw InputError.wrongInput
        }
        guard input == "1" || input == "2" else {
            throw InputError.wrongInput
        }
        return input
    }
}
