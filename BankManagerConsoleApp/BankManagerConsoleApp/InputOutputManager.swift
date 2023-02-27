//
//  InputOutputManager.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/27.
//

import Foundation

enum InputOutputManager {
    static func output(state: BankState) {
        print(state.text, terminator: "")
    }
    
    static func input() -> String {
        guard let userInput = readLine() else {
            return ""
        }
        return userInput
    }
}

enum BankState {
    case open
    case close(UInt, Double)
    case working(UInt, Bool)
}

fileprivate extension BankState {
    var text: String {
        switch self {
        case .open:
            return BankTextCollection.state
        case .close(let numberOfCustomer, let customerTime):
            return BankTextCollection.close(numberOfCustomer: numberOfCustomer, customerTime: customerTime)
        case .working(let order, let result):
            return BankTextCollection.working(order: order, result: result)
        }
    }
}
