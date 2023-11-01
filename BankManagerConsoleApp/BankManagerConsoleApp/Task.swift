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
}
