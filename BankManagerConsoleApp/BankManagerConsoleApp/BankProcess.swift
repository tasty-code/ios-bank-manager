//
//  BankProcess.swift
//  BankManagerConsoleApp
//
//  Created by 김예준 on 11/7/23.
//

import Foundation

final class BankProcess {
    private let bank: Bank
    
    init(loanClerkCount: Int, depositClerkCount: Int) {
        let bankManager: BankManagable = BankManager(loanClerkCount: loanClerkCount, depositClerkCount: depositClerkCount)
        self.bank = Bank(bankManager: bankManager)
    }
    
    func run() {
        while true {
            self.showMenuScript()
            let clientCount = Int.random(in: 10...30)
            
            guard let input = readLine(),
                  let userInput = Menu(rawValue: input)
            else {
                continue
            }
            
            switch userInput {
            case .open:
                self.bank.proceedBanking(clientCount: clientCount)
            case .exit:
                return
            case .wrongInput:
                print(ProcessMenual.wrongInput)
            }
        }
    }
    
    private func showMenuScript() {
        print(ProcessMenual.menu)
        print(ProcessMenual.inputField, terminator: "")
    }
}

extension BankProcess {
    private enum Menu: String {
        case open
        case exit
        case wrongInput
        
        init?(rawValue: String) {
            switch rawValue {
            case "1":
                self = .open
            case "2":
                self = .exit
            default:
                self = .wrongInput
            }
        }
    }
}

extension BankProcess {
    private enum ProcessMenual: CustomStringConvertible {
        case menu
        case inputField
        case wrongInput
        
        var description: String {
            switch self {
            case .menu:
                return "1 : 은행개점\n2 : 종료"
            case .inputField:
                return "입력 : "
            case .wrongInput:
                return "잘못된 입력입니다."
            }
        }
    }
}
