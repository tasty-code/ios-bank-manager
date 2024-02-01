import Foundation

enum BankManagerError: LocalizedError {
    case invalidInput
    
    var message: String {
        switch self {
        case .invalidInput:
            return "1 혹은 2를 입력하세요."
        }
    }
}

