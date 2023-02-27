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
