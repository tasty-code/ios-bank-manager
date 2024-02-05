import Foundation

struct Customer {
    let waitingNumber: Int
    var bankingService: BankingService = .deposit
    let taskTime: TimeInterval
    
    init(waitingNumber: Int, taskType: BankingService) {
        self.waitingNumber = waitingNumber
        self.bankingService = taskType
        self.taskTime = taskType.defaultTaskTime
    }
}

enum BankingService: CaseIterable {
    case deposit
    case loan
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    var defaultTaskTime: TimeInterval {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}

extension BankingService {
    static var randomBankingService: BankingService {
        guard let bankingService = self.allCases.randomElement() else {
            return .deposit
        }
        return bankingService
    }
}
