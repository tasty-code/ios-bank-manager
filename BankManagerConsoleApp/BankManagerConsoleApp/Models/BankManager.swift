import Foundation

struct BankManager {
    func deal(with customer: Customer,
              isLastCustomer: Bool,
              completionHandler: ((BankManager, Task, Bool) -> Void)) {
        Message.start(number: customer.number, task: customer.task).printMessage()
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: customer.task.time)
        }
        Message.complete(number: customer.number, task: customer.task).printMessage()
        completionHandler(self, customer.task, isLastCustomer)
    }
}
