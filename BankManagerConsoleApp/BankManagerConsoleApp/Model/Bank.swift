//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/27.
//

import Foundation

struct Bank: CustomerManageable {

    let todayCounter = Counter()
    let accountBanker = Banker(processingTime: 0.7)
    let loanBanker = Banker(processingTime: 1.1)

    func open() {
        let numberOfTodayCustomers = makeAcceptableNumber()
        let customerQueue = makeCustomerQueue(maxCount: numberOfTodayCustomers)
        let loanSemaphore = DispatchSemaphore(value: 1)
        let accountSemaphore = DispatchSemaphore(value: 2)
        let group = DispatchGroup()

        while !customerQueue.isEmpty() {
            guard let currentCustomer = customerQueue.dequeue() else { return }

            let currentCustomerWorkType = currentCustomer.workType

            switch currentCustomerWorkType {
            case WorkList.account.rawValue :
                DispatchQueue.global().async(group: group) {
                    accountSemaphore.wait()
                    accountBanker.work(of: currentCustomer.waitingOrder, for: currentCustomerWorkType)
                    todayCounter.addAccountCustomer()
                    accountSemaphore.signal()
                }
            default:
                DispatchQueue.global().async(group: group) {
                    loanSemaphore.wait()
                    loanBanker.work(of: currentCustomer.waitingOrder, for: currentCustomerWorkType)
                    todayCounter.addLoanCustomer()
                    loanSemaphore.signal()
                }
            }
        }

        group.wait()

        showWorkFinishMessage(numberOfTodayCustomers)
        todayCounter.resetCounter()
    }

    func showWorkFinishMessage(_ totalNumber: Int) {
        let calculateWorkTime = calculateTotalWorkTime(customers: todayCounter.getAccountCustomerCount(), todayCounter.getLoanCustomerCount(), processingTimes: accountBanker.processingTime, loanBanker.processingTime)
        let convertDoubleToString = String(format: "%.2f", calculateWorkTime)

        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumber)명이며, 총 업무시간은 \(convertDoubleToString)초입니다.")
    }

    func calculateTotalWorkTime(customers: Int..., processingTimes: Double...) -> Double {
        var result = 0.0

        customers.enumerated().forEach {
            let partialResult = Double($1) * processingTimes[$0]
            result += partialResult
        }

        return result
    }

}
