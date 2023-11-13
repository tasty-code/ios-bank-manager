//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private let bank: Bankable
    private var userChoice: Int = 0
    
    var isStart: Bool {
        if userChoice == 1 {
            return true
        } else {
            return false
        }
    }
    
    init(bank: Bankable) {
        self.bank = bank
    }
    
    func startBusiness() {
        while true {
//            print(BankDialogue.menu)
//            print(BankDialogue.input, terminator: "")
//            guard let input = readLine(), let number = Int(input) else {
//                return
//            }
            
//            userChoice = number
            
            if isStart {
                let (taskProcessingTime, handledCustomer) = bank.beginTask()
//                print(BankDialogue.close(handledCustomer, workTime: taskProcessingTime))
            } else {
                break
            }
        }
    }
}
