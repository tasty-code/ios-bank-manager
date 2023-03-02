//
//  UserInputReceivable.swift
//  BankManagerConsoleApp
//
//  Created by 이상윤 on 2023/02/22.
//

import Foundation

protocol UserInputReceivable {

    func getUserInput() -> Int?
}

extension UserInputReceivable {

    func getUserInput() -> Int? {
        guard let userInput = readLine() else {
            return nil
        }

        return Int(userInput)
    }
}
