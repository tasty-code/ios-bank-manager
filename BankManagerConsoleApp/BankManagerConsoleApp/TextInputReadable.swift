//
//  TextInputReadable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/28/24.
//

protocol TextInputReadable {
    func readInput(prompt: String?) throws -> String
}

protocol TextOutputDisplayable {
    func display(output: String)
}
