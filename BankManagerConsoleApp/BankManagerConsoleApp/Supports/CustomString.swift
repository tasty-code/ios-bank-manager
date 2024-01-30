import Foundation

enum CustomString: CustomStringConvertible {
    
    case format
    case printMenuText
    case isEmptyText
    case startCustomerBusiness(Int)
    case endCustomerBusiness(Int)
    case resultBusiness(Int, Double)
    case wrongInputMessage
    case bankClose
    case numberOneText
    case numberTwoText
    
    var description: String {
        switch self {
            
        case .format:
            return "%.2f"
        case .printMenuText:
            return """
                    1 : 은행 개점
                    2 : 종료
                    입력 : 
                    """
        case .isEmptyText:
            return ""
        case .startCustomerBusiness(let number):
            return "\(number)번 고객 업무 시작"
        case .endCustomerBusiness(let number):
            return "\(number)번 고객 업무 종료"
        case .resultBusiness(let customerCount, let time):
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총  \(customerCount)명이며, 총 업무시간은 \(time)초입니다."
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
