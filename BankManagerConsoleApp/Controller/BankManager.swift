//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var isOpen: Bool = true
    private var employees: [Employee] = []
    private var customerManager: CustomerManager = CustomerManager()
    private var totalTaskTime: Double { Double(customerManager.customers.count * 700) / 1000 }
    
    mutating func operate() {
        while isOpen {
            customerManager.resetCustomer()
            printMenuOfBank()
            do {
                let input = try selectedByUser()
                executeBankingOperation(of: input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private mutating func executeBankingOperation(of input: String) {
        switch input {
        case "1":
            customerManager.createCustomer()
            customerManager.registerCustomer(with: customerManager.customers)
            createEmployee()
            handleCustomerTasks()
            reportDeadlineSummary()
        case "2":
            print("은행종료")
            isOpen = false
        default:
            break
        }
    }
    
    private func selectedByUser() throws -> String {
        guard let input = readLine(), input == "1" || input == "2" else {
            throw InputError.wrongInput
        }
        return input
    }
    
    private func printMenuOfBank() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    private func reportDeadlineSummary() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerManager.customers.count)명이며, 총 업무시간은 \(totalTaskTime)초 입니다.")
    }
    
    private mutating func createEmployee() {
        employees.append(Employee())
    }
    
    private func handleCustomerTasks() {
        employees[0].handleCustomerTasks(with: customerManager.ticketMachine)
    }
}
