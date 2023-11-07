import Foundation
enum Task: CustomStringConvertible, CaseIterable {
    case deposit
    case loan
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    static func start(_ orderNumber: Int, _ task: Task) -> String { "\(orderNumber)번 고객 \(task)업무 시작" }

    static func complete(_ orderNumber: Int, _ task: Task) -> String { "\(orderNumber)번 고객 \(task)업무 완료" }
    
    static func random() -> Task {
        let allCases = self.allCases
            let randomIndex = Int.random(in: 0..<allCases.count)
            return allCases[randomIndex]
        }
}
