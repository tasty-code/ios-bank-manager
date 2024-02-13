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
