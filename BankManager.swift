//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private let bank: Bank
    
    init() {
        let tellers = [Teller(workType: .deposit), Teller(workType: .deposit), Teller(workType: .loan)]
        self.bank = Bank(tellers: tellers)
    }
    
    func run() {
        do {
            InterfaceMessage.printMenuScript()
            let input = try getUserInput()
            if input == "1" {
                bank.work { self.run() }
            } else {
                return
            }
        } catch let error {
            print(error)
            run()
        }
    }
}

// MARK: Private Methods
extension BankManager {
    private func getUserInput() throws -> String {
        guard let input = readLine(), input == "1" || input == "2" else { throw InterfaceErrorMessage.wrongMenuSelected }
        return input
    }
}
