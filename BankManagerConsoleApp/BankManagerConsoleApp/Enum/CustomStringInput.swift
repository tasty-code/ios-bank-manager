import Foundation

enum CustomStringInput {
    
    case wrongInputMessage
    case bankClose
    case numberOneText
    case numberTwoText
}

extension CustomStringInput: CustomStringConvertible {
    
    var description: String {
        switch self {
            
        case .wrongInputMessage:
            return "잘못된 입력입니다. 다시 입력해주세요."
        case .bankClose:
            return "은행을 종료합니다."
        case .numberOneText:
            return "1"
        case .numberTwoText:
            return "2"
        }
    }
}
