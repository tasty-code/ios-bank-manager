
import Foundation

struct Banker {
    func provideService(to customer: Customer) -> Double {
        serviceDidStart(customerNumber: customer.waitingNumber)
        serviceDidComplete(customerNumber: customer.waitingNumber)
        return customer.requiredTime
    }
    
    private func serviceDidStart(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
    }
    
    private func serviceDidComplete(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 완료")
    }
}
