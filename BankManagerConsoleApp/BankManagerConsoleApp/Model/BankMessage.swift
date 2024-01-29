enum BankMessage {
    case menu
    case wrongInput
    case taskStart(with: Int)
    case taskComplete(with: Int)
    case close(customersCount: Int, totalProcessingTime: Double)
}

extension BankMessage {
    func message() {
        switch self {
        case .menu:
            print("1 : 은행개점\n2 : 종료\n입력 :", terminator: " ")
        case .wrongInput:
            print("1 혹은 2 를 입력하세요.")
        case .taskStart(let customer):
            print("\(customer)번 고객 업무 시작")
        case .taskComplete(let customer):
            print("\(customer)번 고객 업무 종료")
        case .close(let customersCount, let totalProcessingTime):
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customersCount)명이며, 총 업무시간은 \(totalProcessingTime)초입니다.")
        }
    }
}
