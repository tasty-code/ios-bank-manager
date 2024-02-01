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
    
    func startBank() {
        let tasks: [BankTaskType: any ClientQueueManagable] = [
            .loan: ClientManager<Loan>(),
            .deposit: ClientManager<Deposit>(),
        ]

        let orders: [BankTaskType: Int] = [.loan: 2, .deposit: 3]
        let bankers = makeBankers(
            tasks: tasks,
            orders: orders,
            output: self.output
        )
        
        BankManager(
            bankers: bankers,
            clientManager: tasks,
            output: self.output
        ).start()
    }

    func makeBankers(
        tasks: [BankTaskType: any ClientQueueManagable],
        orders: [BankTaskType: Int],
        output: TextOutputDisplayable
    ) -> [Banker] {
        return orders.flatMap { (taskType, count) in
            (1...count).compactMap { _ in
                guard let clientManager = tasks[taskType] else { return nil }
                return Banker(
                    clientManager: clientManager,
                    taskOutput: output
                )
            }
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
    
    func handle(error: Error) {
        self.output.display(output: error.localizedDescription)
    }
}
