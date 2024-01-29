//
//  BankManagerApp.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

final class BankManagerApp {
    private let input: TextInputReadable
    
    private let output: TextOutputDisplayable
    
    private var isRunning: Bool = true
    
    init(inputHandler: TextInputReadable, outputHandler: TextOutputDisplayable) {
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
        self.output.display(output: BankManagerAppMenu.allMenusPrompt)
        do {
            let input = try self.input.readInput(prompt: "입력:")
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
        self.output.display(output: error.localizedDescription)
    }
}
