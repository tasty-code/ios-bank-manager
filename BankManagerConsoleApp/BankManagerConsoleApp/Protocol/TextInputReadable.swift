//
//  TextInputReadable.swift
//  BankManagerConsoleApp
//
//  Created by 강창현 on 2/1/24.
//

protocol TextInputReadable {
    func readInput(prompt: String?) throws -> String
}
