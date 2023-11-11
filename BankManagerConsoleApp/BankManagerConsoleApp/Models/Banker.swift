import Foundation

struct Banker {
    func work(for customer: Customer) {
        let task = customer.task
        let name = task.name
        let processingTime = task.processingTime
        
        print(start(customer.orderNumber, name))
        Thread.sleep(forTimeInterval: processingTime)
        print(complete(customer.orderNumber, name))
    }
}

extension Banker {
    func start(_ orderNumber: Int, _ task: String) -> String { "\(orderNumber)번 고객 \(task)업무 시작" }
    
    func complete(_ orderNumber: Int, _ task: String) -> String { "\(orderNumber)번 고객 \(task)업무 완료" }
}
