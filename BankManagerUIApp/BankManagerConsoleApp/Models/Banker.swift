import Foundation

struct Banker {
    func work(_ delegate: BankerDelegate?, for customer: Customer, _ isReset: Bool) {
        let task = customer.task
        let processingTime = task.processingTime
        
        if !isReset {
            delegate?.addWorkingStackView(self, customer)
            Thread.sleep(forTimeInterval: processingTime)
            delegate?.deleteWorkingStackView(self, customer)
        }
    }
}
