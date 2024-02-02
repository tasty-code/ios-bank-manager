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
            taskTypes: BankTask.allCasesSet
        )
    }
    
    private static func componentIndices(
        totalIndexCount: Int,
        taskTypes: Set<BankTask>
    ) throws -> [BankTask: [Int]] {
        var result: [BankTask: [Int]] = [:]
        guard totalIndexCount >= 1 else { return [:] }
        var shuffled = (1...totalIndexCount).shuffled()
        var remain = totalIndexCount
        for (index, taskType) in taskTypes.enumerated() {
            guard index != taskTypes.count - 1 else {
                result.updateValue(shuffled.sorted(by: >), forKey: taskType)
                break
            }
            guard let chunkSize = (0...remain).randomElement() else { throw BankManagerAppError.outOfIndex }
            let chunk: [Int] = chunkSize == 0 ? [] : (1...chunkSize).reduce(into: []) { partialResult, _ in
                let index = shuffled.removeLast()
                partialResult.append(index)
            }
            result.updateValue(chunk.sorted(by: >), forKey: taskType)
            remain -= chunkSize
        }
        return result
    }
}

extension TicketDispenser: TicketProvidable {
    func provideTicket(of taskType: BankTask) -> Int? {
        guard
            let indiceArrayIsEmpty = self.ticketNumbers[taskType]?.isEmpty,
            indiceArrayIsEmpty == false
        else {
            return nil
        }
        return self.ticketNumbers[taskType]?.removeLast()
    }
}

