//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private let bank: Bank
    
    init() {
        let tellers = [Teller(tellerCount: 2), Teller(tellerCount: 1)]
        self.bank = Bank(tellers: tellers)
    }
    
    func run() {
        do {
            InterfaceMessage.printMenuScript()
            let interfaceMenu = try selectInterfaceMenu()
            if interfaceMenu == .run {
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
    private func selectInterfaceMenu() throws -> InterfaceMenu {
        guard let input = readLine(),
              let integerInput = Int(input),
              integerInput == 1 || integerInput == 2,
              let interfaceMenu = try? InterfaceMenu.convertIntToInterfaceMenu(integerInput)
        else { throw InterfaceErrorMessage.wrongMenuSelected }
        return interfaceMenu
    }
}
