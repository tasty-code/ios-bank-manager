import Foundation

struct DepositTask: Taskable {
    static let name: String = "입금"
    static let semaphore: DispatchSemaphore = DispatchSemaphore(value: 2)
    static let processingTime: Double = 0.7
    
    private init() {}
}
