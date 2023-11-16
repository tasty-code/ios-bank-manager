import Foundation

struct Banker {
    func work(for customer: Customer, _ delegate: BankerDelegate?) {
        let task = customer.task
        let processingTime = task.processingTime
        
        delegate?.addWorkingStackView(self, customer)
        Thread.sleep(forTimeInterval: processingTime)
        delegate?.deleteWorkingStackView(self, customer)
    }
}
