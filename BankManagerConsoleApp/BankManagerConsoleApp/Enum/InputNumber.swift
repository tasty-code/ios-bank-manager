import Foundation

enum InputNumber {
    case one
    case two
}

extension InputNumber: CustomStringConvertible {
    
    var description: String {
        switch self {
            
        case .one:
            return "1"
        case .two:
            return "2"
        }
    }
}
