//
//  main.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/12.
//
import Foundation

var bank = Bank()
bank.bankClerkList.append(BankClerk(workType: WorkType.loan))
bank.bankClerkList.append(BankClerk(workType: WorkType.deposit))
bank.bankClerkList.append(BankClerk(workType: WorkType.deposit))

bank.openBank()

if var clientQueue = bank.clientQueue {
    while(!clientQueue.isEmpty) {
        let client = clientQueue.dequeue()
        for clerk in bank.bankClerkList {
            DispatchQueue.global().async {
                if client?.workType == clerk.workType {
                    clerk.bankService(for: client!)
                }
            }
        }
    }
    print("업무종료")
}

