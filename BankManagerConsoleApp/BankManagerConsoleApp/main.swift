//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

run()

private func run() {
    
    InputOutputManager.output(state: .open)
    let userInput = InputOutputManager.input()

    switch Menu(rawValue: userInput) {
    case .open:
        start()
    case .close:
        return
    case .none:
        print("올바르지 않은 입력")
    }
    run()
}

private func start() {
    let queue: WaitingQueue<CustomerInfo> = WaitingQueue()
    
    BankManager(waitingQueue: queue).open()
}
