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
        let startDate = Date()

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

        let elapsedTime = Date().timeIntervalSince(startDate)

        showWorkFinishMessage(numberOfTodayCustomers, elapsedTime)
    }

    func showWorkFinishMessage(_ totalNumber: Int, _ workTime: TimeInterval) {
        let convertTimeIntervalToString = String(format: "%.2f", workTime)

        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumber)명이며, 총 업무시간은 \(convertTimeIntervalToString)초입니다.")
    }
}
