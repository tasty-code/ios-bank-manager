//
//  TicketDispenser.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 2/1/24.
//

final class TicketDispenser {
    private var ticketNumbers: [BankTask: [Int]]
    
    init(totalClientCount: Int) throws {
        self.ticketNumbers = try Self.componentIndices(
            totalIndexCount: totalClientCount,
            taskTypes: BankTask.allCases
        )
    }
    
    private static func componentIndices(
        totalIndexCount: Int,
        taskTypes: [BankTask]
    ) throws -> [BankTask: [Int]] {
        var result: [BankTask: [Int]] = taskTypes.reduce(into: [:]) { partialResult, task in
            partialResult.updateValue([], forKey: task)
        }
        
        for number in 1...totalIndexCount {
            guard let type = taskTypes.randomElement() else { throw BankManagerAppError.outOfIndex }
            result[type]?.append(number)
        }
        
        for type in taskTypes {
            result[type]?.reverse()
        }
        return result
    }
}

extension TicketDispenser: TicketProvidable {
    func provideTicket(of taskType: BankTask) -> Int? {
        return self.ticketNumbers[taskType]?.popLast()
    }
}
