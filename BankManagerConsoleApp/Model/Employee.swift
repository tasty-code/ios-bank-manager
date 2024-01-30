
import Foundation

struct Employee {
    var assignedTask: String = "업무"
    
    func handleCustomerTasks(with customersQueue: Queue<Customer>) {
        var customers = customersQueue
        for _ in 1...customers.totalLength() {
            guard let customer = customers.dequeue() else { return }
            print("\(customer.ticketNumber)번 고객 \(customer.task)시작")
            usleep(700000)
            print("\(customer.ticketNumber)번 고객 \(customer.task)종료")
        }
    }
}
