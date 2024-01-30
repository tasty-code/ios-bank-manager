//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/28/24.
//

struct ConsoleManager { }

extension ConsoleManager: TextInputReadable {
    func readInput(prompt: String?) throws -> String {
        if let prompt {
            print(prompt, terminator: " ")
        }
        guard let input = readLine() else {
            throw IOError.unexpectedError
        }
        return input
    }
}

extension ConsoleManager: TextOutputDisplayable {
    func display(output: String) {
        print(output)
    }
}
