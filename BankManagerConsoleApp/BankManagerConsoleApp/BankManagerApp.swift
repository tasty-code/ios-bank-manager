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
        let inputResult = self.input.handleInput(prompt: "입력:")
        guard
            case .success(let input) = inputResult,
            let number = Int(input),
            let menu = BankManagerAppMenu(number: number)
        else {
            handleInputError()
            return
        }
        handleMenu(menu)
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
        let clientDispatcher = ClientManager()
        let bankers = [
            Banker.init(name: "1", dispatcher: clientDispatcher),
        ]
        BankManager(bankers: bankers, clientDispatcher: clientDispatcher).start()
    }
    
    private func handleInputError() {
        self.output.handleOutput("메뉴 번호를 보고 다시 입력해주세요.")
    }
}
