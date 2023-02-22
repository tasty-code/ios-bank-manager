//
//  Receivable.swift
//  BankManagerConsoleApp
//
//  Created by 이상윤 on 2023/02/22.
//

import Foundation

protocol Receivable {

    func getUserInput() -> String?
}

extension Receivable {

    func getUserInput() -> String? {
        guard let userInput = readLine() else {
            return nil
        }
        return userInput
    }
}
