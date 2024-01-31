//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/31/24.
//

struct ConsoleManager { }

extension ConsoleManager: TextOutputDisplayable {
    func display(output: String) {
        print(output)
    }
}
