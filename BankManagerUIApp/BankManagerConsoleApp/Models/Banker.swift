import Foundation

struct Banker {
    func work(for customer: Customer, _ delegate: BankerDelegate?, _ isReset: Bool) {
        let task = customer.task
        let processingTime = task.processingTime
        
        if !isReset {
            delegate?.addWorkingStackView(self, customer)
            Thread.sleep(forTimeInterval: processingTime)
            delegate?.deleteWorkingStackView(self, customer)
        }
    }
}
