//
//  TextInputHandlable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/28/24.
//

protocol TextInputHandlable {
    func handleInput(prompt: String?) -> Result<String, IOError>
}

protocol TextOutputHandlable {
    func handleOutput(_ output: String)
}
