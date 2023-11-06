import Foundation

class BankManager {
    private let customerCount: Int
    private let teller: Teller
    private let queue: Queue<Int> = Queue<Int>()
    
    init(tellerCount: Int) {
        self.customerCount = Int.random(in: 10...30)
        self.teller = Teller(tellerCount: tellerCount)
    }
    
    private func createCustomerQueue(customer: Int) {
        for n in 1...customer {
            queue.enqueue(data: n)
        }
    }
    
    func startTask() {
        createCustomerQueue(customer: customerCount)
        teller.doTask(queue: queue, customer: customerCount)
    }
    
    func finishTask() {
        let totalSecond = String(format: "%.2f", Double(customerCount) * 0.7)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(totalSecond)초 입니다.")
    }
}
