//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum WorkList: String, CustomStringConvertible {
    case openBank = "1"
    case closeBank = "2"
    
    var description: String {
        return self.rawValue
    }
}

struct BankManager {
    static func startProcess() {
        var isContinue = true
        
        repeat {
            print(OutputMessage.programStart)
            
            guard let userInput = readLine() else {
                return
            }
            
            switch WorkList(rawValue: userInput) {
            case .openBank:
                return
            case .closeBank:
                OutputMessage.exitProgram(userInput)
                isContinue = false
            default:
                return
            }
        } while isContinue == true
    }
}
