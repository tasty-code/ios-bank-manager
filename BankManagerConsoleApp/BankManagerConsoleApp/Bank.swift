//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 둘리 on 2024/01/29.
//

import Foundation

struct Bank {
    let bankManager = BankManager()
    let bankClerk = BankClerk()
    let customNum: Int
    
    init(customNum: Int) {
        self.customNum = customNum
    }
    
    func openBank() {
        bankManager.assign()
        closeBank()
    }
    
    func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 명이며, 총 업무시간은 초 입니다.")
    }
}
