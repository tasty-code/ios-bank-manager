
import Foundation

enum BankingService: CaseIterable {
    case deposit, loan
}

struct Customer: Equatable {
    private(set) var requiredTime: Double
    private(set) var waitingNumber: Int
    private(set) var requiredService: BankingService
}
