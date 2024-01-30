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
        let loanClientManager = ClientManager<Loan>()
        let depositClientManager = ClientManager<Deposit>()
        let bankers = [
            Banker.init(
                name: "에피",
                clientManager: loanClientManager,
                taskOutput: output
            ),
            Banker.init(
                name: "카일",
                clientManager: depositClientManager,
                taskOutput: output
            ),
            Banker.init(
                name: "두두",
                clientManager: depositClientManager,
                taskOutput: output
            ),
        ]
        
        BankManager(
            bankers: bankers,
            clientManager: [
                .loan: loanClientManager,
                .deposit: depositClientManager
            ],
            output: self.output
        ).start()
    }
    
    func handle(error: Error) {
        self.output.display(output: error.localizedDescription)
    }
}
