//
//  BankManagerApp.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 2/1/24.
//

struct BankManagerApp {
    func start() {
        let console = ConsoleManager()
        let bankManager = BankManager(textOut: console)

        guard
            let totalClientNumber = (10...30).randomElement(),
            let number = (1...totalClientNumber).randomElement()
        else { fatalError() }

        let taskTypes: [Taskable] = [Loan(), Deposit()]

        let array = componentIndices(
            totalIndexCount: totalClientNumber,
            chunkCount: taskTypes.count
        )

        let orders = [
            Order(taskType: Loan.self, bankerCount: 2, clientNumbers: array[0]),
            Order(taskType: Deposit.self, bankerCount: 3, clientNumbers: array[1]),
        ]

        bankManager.runBank(with: orders)
    }
}

private extension BankManagerApp {
    func componentIndices(totalIndexCount: Int, chunkCount: Int) -> [[Int]] {
        var result: [[Int]] = []
        guard totalIndexCount >= 1 else { return [] }
        var shuffled = (1...totalIndexCount).shuffled()
        var remain = totalIndexCount
        for iteration in 1...chunkCount {
            guard iteration != chunkCount else {
                result.append(shuffled)
                break
            }
            guard let chunkSize = (0...remain).randomElement() else { fatalError() }
            let chunk: [Int] = chunkSize == 0 ? [] : (1...chunkSize).reduce(into: []) { partialResult, _ in
                let index = shuffled.removeLast()
                partialResult.append(index)
            }
            result.append(chunk)
            remain -= chunkSize
        }
        return result
    }

}

