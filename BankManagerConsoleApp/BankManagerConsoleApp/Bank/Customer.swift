import Foundation

struct Customer {
    let waitingNumber: Int
    let bankingService: BankingService
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
