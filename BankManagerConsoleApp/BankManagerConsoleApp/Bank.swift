//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이은호 on 2022/10/17.
//

import Foundation

class Bank {
    let waitingNumberQueue = Queue<Int>()
    let clientNumber = Client().generateClientRandomNumber()
    
    func setClientOfWaitingNumber() -> Queue<Int> {
        let firstClient: Int = 1
        let lastClient: Int = clientNumber
        
        for bringWaitingNumber in firstClient...lastClient {
            waitingNumberQueue.enqueue(data: bringWaitingNumber)
        }
        return waitingNumberQueue
    }
    
    func choiceMenu() {
        print("1 : 은행 개점" )
        print("2 : 종료")
        print("입력 : ", terminator: "")
        
        if let inputMenu = readLine(),
           let inputMenu = Int(inputMenu) {
            let bankManager = BankManager()
            if inputMenu == 1 {
                bankManager.work()
            } else if inputMenu == 2 {
                return
            } else {
                choiceMenu()
            }
        }
    }
}
