import Foundation

struct LoanTask: Taskable {
    static let name: String = "대출"
    static let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    static let processingTime: Double = 1.1
    
    private init() {}
}
