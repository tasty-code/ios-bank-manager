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
        let dict: [BankTaskType: any ClientQueueManagable] = [
            .loan: ClientManager<Loan>(),
            .deposit: ClientManager<Deposit>(),
        ]
        
        func makeBankers(orders: [BankTaskType: Int]) -> [Banker] {
            return orders.reduce(into: []) { (
                result: inout [Banker],
                order: (key: BankTaskType, value: Int)
            ) in
                for number in 1...order.value {
                    guard let clientManager = dict[order.key] else { break }
                    let banker = Banker.init(
                        name: "에피",
                        clientManager: clientManager,
                        taskOutput: output
                    )
                    result.append(banker)
                }
            }
        }
        
        let rec: [BankTaskType: Int] = [.loan: 2, .deposit: 3]
        
        let bankers = makeBankers(orders: rec)
        
        BankManager(
            bankers: bankers,
            clientManager: dict,
            output: self.output
        ).start()
    }
    
    func handle(error: Error) {
        self.output.display(output: error.localizedDescription)
    }
}
