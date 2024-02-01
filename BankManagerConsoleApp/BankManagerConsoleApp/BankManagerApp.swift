//
//  BankManagerApp.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 2/1/24.
//

struct BankManagerApp {
    func start() {
        guard let clientCount = (10...30).randomElement() else { fatalError() }
        let console = ConsoleManager()
        let dispenser = TicketDispenser(totalClientCount: clientCount)
        
        let bankManager = BankManager(
            textOut: console,
            dispenser: dispenser
        )
        
        let orders = [
            Order(taskType: .loan, bankerCount: 2),
            Order(taskType: .deposit, bankerCount: 3),
        ]

        bankManager.runBank(with: orders)
    }
}
