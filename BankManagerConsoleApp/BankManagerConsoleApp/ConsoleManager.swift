//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/28/24.
//

struct ConsoleManager { }

extension ConsoleManager: TextInputHandlable {
    func handleInput(prompt: String?) -> Result<String, IOError> {
        if let prompt {
            print(prompt, terminator: " ")
        }
        guard let pureInput = readLine() else {
            return .failure(.invalidInput)
        }
        let input = pureInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard input.isEmpty == false else {
            return .failure(.invalidInput)
        }
        return .success(input)
    }
}

extension ConsoleManager: TextOutputHandlable {
    func handleOutput(_ output: String) {
        print(output)
    }
}
