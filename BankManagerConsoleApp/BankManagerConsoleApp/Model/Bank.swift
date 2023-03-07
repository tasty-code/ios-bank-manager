//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/27.
//

import Foundation

struct Bank: CustomerManageable {
    
    let accountBanker = Banker(processingTime: 0.7)
    let loanBanker = Banker(processingTime: 1.1)
    let processingTimePerPerson = Banker(processingTime: 0.7).processingTime

    func open() {
        let numberOfTodayCustomers = makeAcceptableNumber()
        let customerQueue = makeCustomerQueue(maxCount: numberOfTodayCustomers)

        while !customerQueue.isEmpty() {
            let currentCustomer = customerQueue.dequeue()
            guard let numberOfCurrentCustomer = currentCustomer?.waitingOrder else { return }

            accountBanker.work(of: numberOfCurrentCustomer, for: "account")
        }

        showWorkFinishMessage(numberOfTodayCustomers, processingTimePerPerson)
    }

    func showWorkFinishMessage(_ totalNumber: Int, _ eachProcessingSecond: Double) {
        let totalTime = Double(totalNumber) * eachProcessingSecond
        let convertDoubleToString = String(format: "%.2f", totalTime)

        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumber)명이며, 총 업무시간은 \(convertDoubleToString)초입니다.")
    }
}
