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
    
    func openBank(completionHander: @escaping () -> Void) {
        bank.beginTask(completionHandler: completionHander)
    }
    
    func resetBank() {
        bank.resetCustomer()
    }
}
