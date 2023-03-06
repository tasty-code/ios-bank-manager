//
//  ArrayExtension.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/03/03.
//

import Foundation

extension Array<BankClerkProtocol> {
    typealias Clerk = Element
    
    init(clerksPerType: [BankingService]) {
        let clerks: [[Clerk]] = clerksPerType.map { clerkType in
            switch clerkType {
            case .deposit(let count): return Array(repeating: BankClerkForDeposit(), count: count)
            case .loan(let count): return Array(repeating: BankClerkForLoan(), count: count)
            @unknown case _: break
            }
        }
        self = clerks.flatMap { $0 }
    }
    
    subscript(safe index: Int) -> Clerk? {
        guard index < self.count else { return nil }
        return self[index]
    }
}
