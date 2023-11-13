//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private let bank: Bankable
    private var customerCount: Int = 1
    
    init(bank: Bankable) {
        self.bank = bank
    }
    
    func openBank() {
        bank.beginTask()
    }
    
//    func startBusiness() {
//        while true {
////            print(BankDialogue.menu)
////            print(BankDialogue.input, terminator: "")
////            guard let input = readLine(), let number = Int(input) else {
////                return
////            }
//            
////            userChoice = number
//            
//            if isStart {
//                let (taskProcessingTime, handledCustomer) = bank.beginTask()
////                print(BankDialogue.close(handledCustomer, workTime: taskProcessingTime))
//            } else {
//                break
//            }
//        }
//    }
}
