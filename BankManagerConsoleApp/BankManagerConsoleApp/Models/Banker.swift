import Foundation

struct Banker {
    static let depositTime: Double = 0.7
    static let loanTime: Double = 1.1
    
    func work(for customer: Customer, as time: Double) {
        print(Task.start(customer.id, customer.task))
        Thread.sleep(forTimeInterval: time)
        print(Task.complete(customer.id, customer.task))
    }
}
