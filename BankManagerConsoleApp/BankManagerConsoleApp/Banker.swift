
import Foundation

struct Banker {
    func provideService(to customer: Customer) {
        serviceDidStart(customerNumber: customer.waitingNumber)
        Thread.sleep(forTimeInterval: customer.requiredService.requiredTime)
        serviceDidComplete(customerNumber: customer.waitingNumber)
    }
    
    private func serviceDidStart(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
    }
    
    private func serviceDidComplete(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 완료")
    }
}
