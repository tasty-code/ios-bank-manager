//
//  ArrayExtension.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/03/03.
//

import Foundation

extension Array where Element: BankClerkProtocol {
    subscript(safe index: Int) -> Element? {
        guard index <= self.count else { return nil }
        return self[index]
    }
}
