//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/28/24.
//

struct ConsoleManager { }

extension ConsoleManager: TextInputHandlable {
    func handleInput(prompt: String?) throws -> String {
        if let prompt {
            print(prompt, terminator: " ")
        }
        guard let input = readLine() else {
            throw IOError.unexpectedError
        }
        return input
    }
}

extension ConsoleManager: TextOutputHandlable {
    func handleOutput(_ output: String) {
        print(output)
    }
}
