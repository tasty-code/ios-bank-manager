//
//  BankManagerApp.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 2/1/24.
//

final class BankManagerApp {
    func start() {
        startBank()
    }
}

private extension BankManagerApp {
    func startBank() {
        let tasks: [BankTask: ClientQueueManagable] = [
            .loan: ClientManager(),
            .deposit: ClientManager(),
        ]

        let orders: [BankTask: Int] = [.loan: 2, .deposit: 3]
        let bankers = makeBankers(
            tasks: tasks,
            orders: orders
        )
        
        BankManager(
            bankers: bankers,
            clientManager: tasks
        ).start()
    }

    func makeBankers(
        tasks: [BankTask: any ClientQueueManagable],
        orders: [BankTask: Int]
    ) -> [Banker] {
        var result = [Banker]()
        for (type, bankerCount) in orders {
            (1...bankerCount).forEach { _ in
                guard let clientManager = tasks[type] else { return }
                let banker = Banker(clientManager: clientManager)
                result.append(banker)
            }
        }
        return result
    }
}
