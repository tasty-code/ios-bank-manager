import Foundation

struct Banker {
    func work(for customer: Customer, _ delegate: BankerDelegate?) {
        let orderNumber = customer.orderNumber
        let task = customer.task
        let processingTime = task.processingTime
        
        delegate?.addWorkingStackView(orderNumber)
        Thread.sleep(forTimeInterval: processingTime)
        delegate?.deleteWorkingStackView(orderNumber)
    }
}
