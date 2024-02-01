//
//  BankManagerApp.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 2/1/24.
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
    
    func startBank() {
        guard let clientCount = (10...30).randomElement() else { fatalError() }
        let dispenser = TicketDispenser(totalClientCount: clientCount)
        
        let bankManager = BankManager(
            textOut: self.output,
            dispenser: dispenser
        )
        
        let orders = [
            Order(taskType: .loan, bankerCount: 1),
            Order(taskType: .deposit, bankerCount: 2),
        ]
        
        bankManager.runBank(with: orders)
    }
    
    func handle(menu: BankManagerAppMenu) {
        switch menu {
        case .open:
            startBank()
        case .end:
            self.isRunning = false
        }
    }
    
    func handle(error: Error) {
        self.output.display(output: error.localizedDescription)
    }
}
