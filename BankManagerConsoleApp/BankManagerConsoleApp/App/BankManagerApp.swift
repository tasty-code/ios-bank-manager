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

private extension BankManagerApp {
    func startLoop() {
        self.output.display(output: BankManagerAppMenu.allMenusPrompt)
        do {
            let input = try self.input.readInput(prompt: "입력:")
            let menu = try BankManagerAppMenu(input: input)
            handle(menu: menu)
        } catch {
            handle(error: error)
        }
    }
    
    func handle(menu: BankManagerAppMenu) {
        switch menu {
        case .open:
            startBank()
        case .end:
            self.isRunning = false
        }
    }
    
    func startBank() {
        let clientManager = ClientManager()
        let bankers = [
            Banker.init(
                name: "1",
                clientManager: clientManager,
                taskOutput: output
            ),
        ]
        
        BankManager(
            bankers: bankers,
            clientManager: clientManager,
            output: self.output
        ).start()
    }
    
    func handle(error: Error) {
        self.output.display(output: error.localizedDescription)
    }
}
