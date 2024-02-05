
import Foundation

struct Banker {
    func provideService(to customer: Customer) {
        serviceDidStart(customerNumber: customer.waitingNumber, serviceType: customer.requiredService.value)
        Thread.sleep(forTimeInterval: customer.requiredService.requiredTime)
        serviceDidComplete(customerNumber: customer.waitingNumber, serviceType: customer.requiredService.value)
    }
    
    private func serviceDidStart(customerNumber: Int, serviceType: String) {
        print("\(customerNumber)번 고객 \(serviceType)업무 시작")
    }
    
    private func serviceDidComplete(customerNumber: Int, serviceType: String) {
        print("\(customerNumber)번 고객 \(serviceType)업무 종료")
    }
}
