
import Foundation

struct Banker {
    func serviceDidStart(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
    }
    
    func serviceDidComplete(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 완료")
    }
}
