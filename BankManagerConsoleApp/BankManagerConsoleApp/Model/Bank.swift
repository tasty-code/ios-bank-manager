//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Blu on 2023/02/27.
//

import Foundation

struct Bank: CustomerManageable {

    let accountBanker, loanBanker: Banker

    init() {
        self.accountBanker = Banker(workType: .account)
        self.loanBanker = Banker(workType: .loan)
    }

    func open() {
        let numberOfTodayCustomers = makeAcceptableNumber()
        let customerQueue = makeCustomerQueue(maxCount: numberOfTodayCustomers)
        let loanSemaphore = DispatchSemaphore(value: 1)
        let accountSemaphore = DispatchSemaphore(value: 2)
        let group = DispatchGroup()

        while !customerQueue.isEmpty() {
            guard let currentCustomer = customerQueue.dequeue() else { return }

            switch currentCustomer.workType {
            case WorkType.account.description :
                DispatchQueue.global().async(group: group) {
                    accountSemaphore.wait()
                    accountBanker.work(for: currentCustomer)
                    accountSemaphore.signal()
                }
            default:
                DispatchQueue.global().async(group: group) {
                    loanSemaphore.wait()
                    loanBanker.work(for: currentCustomer)
                    loanSemaphore.signal()
                }
            }
        }

        group.wait()

        showWorkFinishMessage(numberOfTodayCustomers)
    }

    func showWorkFinishMessage(_ totalNumber: Int) {
        let calculateWorkTime = calculateTotalWorkTime(customers: totalNumber, processingTimes: accountBanker.processingTime)
        let convertDoubleToString = String(format: "%.2f", calculateWorkTime)

        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumber)명이며, 총 업무시간은 \(convertDoubleToString)초입니다.")
    }

    func calculateTotalWorkTime(customers: Int, processingTimes: Double) -> Double { Double(customers) * processingTimes }

}
