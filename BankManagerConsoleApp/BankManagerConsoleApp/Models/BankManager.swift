import Foundation

struct BankManager {
    func deal(with customer: Customer,
              completionHandler: ((BankManager) -> Void)) {
        Message.start(number: customer.number).printMessage()
        DispatchQueue.global().sync {
            Thread.sleep(forTimeInterval: Customer.taskTime)
        }
        Message.complete(number: customer.number).printMessage()
        completionHandler(self)
    }
}
