//
//  BankProtocol.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/27.
//

import Foundation

protocol BankProtocol {
    
    func open()
    func close()
    func report(waitingNumber: UInt, taskType: BankAbility.taskType, inProgress: Bool)
    
}
