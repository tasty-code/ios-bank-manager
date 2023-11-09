import Foundation

struct Banker {
    func work(for customer: Customer) {
        let task = customer.task
        let name = task.name
        let processingTime = task.processingTime
        
        print(start(customer.id, name))
        Thread.sleep(forTimeInterval: processingTime)
        print(complete(customer.id, name))
    }
}

extension Banker {
    func start(_ orderNumber: Int, _ task: String) -> String { "\(orderNumber)번 고객 \(task)업무 시작" }
    
    func complete(_ orderNumber: Int, _ task: String) -> String { "\(orderNumber)번 고객 \(task)업무 완료" }
}
