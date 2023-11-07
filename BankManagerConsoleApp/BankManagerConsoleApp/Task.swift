enum Task: String {
    case deposit
    case withdrawal
    case loan
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .withdrawal:
            return "출금"
        case .loan:
            return "대출"
        }
    }
    
    static func start(_ orderNumber: Int) -> String { "\(orderNumber)번 고객 업무 시작" }

    static func complete(_ orderNumber: Int) -> String { "\(orderNumber)번 고객 업무 완료" }
    
}
