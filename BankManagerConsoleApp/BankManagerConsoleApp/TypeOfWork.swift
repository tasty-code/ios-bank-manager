import Foundation

enum TypeOfWork: Int, Equatable, CaseIterable {
    case Deposit, Loan
    
    var time: UInt32 {
        switch self {
        case .Deposit:
            return 700000
        case .Loan:
            return 1100000
        }
    }
    
    var name: String {
        switch self {
        case .Deposit:
            return "예금"
        case .Loan:
            return "대출"
        }
    }
}
