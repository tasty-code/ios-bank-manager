
import Foundation

struct Banker {
    func doYourJob(customerInfo: Customer) -> Double {
        serviceDidStart(customerNumber: customerInfo.waitingNumber)
        serviceDidComplete(customerNumber: customerInfo.waitingNumber)
        return customerInfo.requiredTime
    }
    
    private func serviceDidStart(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
    }
    
    private func serviceDidComplete(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 완료")
    }
}
