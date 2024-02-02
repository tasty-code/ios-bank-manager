
import Foundation

enum BankingService: CaseIterable {
    case deposit, loan
    
    var requiredTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var value: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}

struct Customer: Equatable {
    private(set) var waitingNumber: Int
    private(set) var requiredService: BankingService
}
