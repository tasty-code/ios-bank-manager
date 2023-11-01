import Foundation

class BankManager {
    private let customer: Int
    private let bankClerk: BankClerk
    private let queue: Queue<Int>
    
    init(bankClerk: Int) {
        self.customer = Int.random(in: 10...30)
        self.bankClerk = BankClerk(bankClerk: bankClerk)
        self.queue = Queue<Int>()
    }
    
    
    
    private func createCustomerQueue(customer: Int) {
        for n in 1...customer {
            queue.enqueue(data: n)
        }
    }
    
    func start() {
        createCustomerQueue(customer: customer)
        bankClerk.doTask(queue: queue, customer: customer)
    }
    
   func finishTask() {
       
       let second = String(format: "%.2f", Double(customer) * 0.7)
       print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customer)명이며, 총 업무시간은 \(second)초 입니다.")
    }

}



