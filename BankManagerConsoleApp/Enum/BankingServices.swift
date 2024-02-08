
enum BankingServices: CaseIterable {
    case loan
    case deposit
    
    var name : String {
        switch self {
        case .loan: return "대출"
        case .deposit: return "예금"
        }
    }
}
