import Foundation

class BankManager {
    private let customer: Int
    private let teller: Teller
    private let queue: Queue<Int>
    
    init(tellerCount: Int) {
        self.customer = Int.random(in: 10...30)
        self.teller = Teller(tellerCount: tellerCount)
        self.queue = Queue<Int>()
    }
    
    private func createCustomerQueue(customer: Int) {
        for n in 1...customer {
            queue.enqueue(data: n)
        }
    }

    func startTask() {
        createCustomerQueue(customer: customer)
        teller.doTask(queue: queue, customer: customer)
    }
    
   func finishTask() {
       let totalSecond = String(format: "%.2f", Double(customer) * 0.7)
       print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer)명이며, 총 업무시간은 \(totalSecond)초 입니다.")
    }

}



