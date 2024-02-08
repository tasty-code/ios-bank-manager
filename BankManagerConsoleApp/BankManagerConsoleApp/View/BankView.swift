//
//  BankView.swift
//  BankManagerConsoleApp
//
//  Created by 루피, 진 on 2/6/24.
//

protocol BankViewProtocol {
    func printConsolView(message: Any, terminator: String?)
}

struct BankView: BankViewProtocol {
    
    func printConsolView(message: Any, terminator: String?) {
        if let terminator = terminator == nil ? "\n" : terminator?.description {
            print(message, terminator: terminator)
        }
    }
}
