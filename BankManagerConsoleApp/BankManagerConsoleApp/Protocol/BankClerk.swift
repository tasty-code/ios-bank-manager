//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 정재근 on 2022/10/17.
//

import Foundation

protocol BankClerk {
    var count: Int { get set }
    
    func bankService(in client: Client)
}
