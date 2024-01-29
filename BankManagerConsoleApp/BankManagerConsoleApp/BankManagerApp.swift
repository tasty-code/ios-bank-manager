//
//  BankManagerApp.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

final class BankManagerApp {
    private let input: TextInputHandlable
    
    private let output: TextOutputHandlable
    
    private var isRunning: Bool = true
    
    init(inputHandler: TextInputHandlable, outputHandler: TextOutputHandlable) {
        self.input = inputHandler
        self.output = outputHandler
    }
    
    func start() {
        while self.isRunning {
            startLoop()
        }
    }
}

extension BankManagerApp {
    private func startLoop() {
        self.output.handleOutput(BankManagerAppMenu.allMenusPrompt)
        do {
            let input = try self.input.handleInput(prompt: "입력:")
            let menu = try BankManagerAppMenu(input: input)
            handleMenu(menu)
        } catch {
            handleInputError(error)
        }
    }
    
    private func handleMenu(_ menu: BankManagerAppMenu) {
        switch menu {
        case .open:
            startBank()
        case .end:
            self.isRunning = false
        }
    }
    
    private func startBank() {
        let clientManager = ClientManager()
        let bankers = [
            Banker.init(
                name: "1",
                clientManager: clientManager,
                taskOutput: output
            ),
        ]
        BankManager(bankers: bankers, clientManager: clientManager).start()
    }
    
    private func handleInputError(_ error: Error) {
        self.output.handleOutput(error.localizedDescription)
    }
}
