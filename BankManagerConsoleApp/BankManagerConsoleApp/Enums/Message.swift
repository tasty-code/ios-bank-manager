enum Message {
    case menu
    case input
    case wrongInput
    case start(number: Int, task: Task)
    case complete(number: Int, task: Task)
    case close(customerCount: Int, time: Double)
}

extension Message {
    func printMessage() {
        switch self {
        case .menu:
            print("""
            1 : 은행개점
            2 : 종료
            """)
        case .input:
            print("입력 : ", terminator: "")
        case .wrongInput:
            print("잘못된 입력입니다. 다시 입력해주세요.")
        case .start(let number, let task):
            print("\(number)번 고객 \(task.decription)업무 시작")
        case .complete(let number, let task):
            print("\(number)번 고객 \(task.decription)업무 완료")
        case .close(let customerCount, let time):
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(String(format: "%.2f", time))초입니다.")
        }
    }
}
