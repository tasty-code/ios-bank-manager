import Foundation

struct Customer {
    let waitingNumber: Int
    let taskType: TaskType
    let taskTime: TimeInterval
    
    init(waitingNumber: Int, taskType: TaskType) {
        self.waitingNumber = waitingNumber
        self.taskType = taskType
        self.taskTime = taskType.defaultTaskTime
    }
}

enum TaskType {
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
