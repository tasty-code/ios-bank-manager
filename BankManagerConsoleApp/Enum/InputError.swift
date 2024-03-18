
import Foundation

enum InputError: LocalizedError {
    case wrongInput
    
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "보여지는 메뉴의 숫자만 입력하세요!"
        }
    }
}
