import Foundation

enum Task {
    
    case loan
    case deposit
}

extension Task: CustomStringConvertible, CaseIterable {
    
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
}
