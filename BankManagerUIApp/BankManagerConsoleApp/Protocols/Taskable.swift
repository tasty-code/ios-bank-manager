import Foundation

protocol Taskable {
    static var name: String { get }
    static var semaphore: DispatchSemaphore { get }
    static var processingTime: Double { get }
}
