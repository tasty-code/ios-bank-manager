//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이은호 on 2022/10/17.
//

import Foundation

class Bank {
    var bankManager: Int = 1
    private let waitingNumberQueue = Queue<Int>()
    private let clientNumber = Client().generateClientRandomNumber()
    
    func setClientOfWaitingNumber() -> Queue<Int> {
        let firstClient: Int = 1
        let lastClient: Int = clientNumber
        
        for bringWaitingNumber in firstClient...lastClient {
            waitingNumberQueue.enqueue(data: bringWaitingNumber)
        }
        return waitingNumberQueue
    }
    
    private func showMenu() {
        print("1 : 은행 개점" )
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    func runApp() {
        showMenu()
        if let inputStringMenu = readLine(),
           let inputIntMenu = Int(inputStringMenu) {
            let bankManager = BankManager()
            if inputIntMenu == 1 {
                bankManager.work()
            } else if inputIntMenu == 2 {
                return
            } else {
                runApp()
            }
        }
    }
}
