//
//  TextInputHandlable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/28/24.
//

protocol TextInputHandlable {
    func handleInput(prompt: String?) throws -> String
}

protocol TextOutputHandlable {
    func handleOutput(_ output: String)
}
