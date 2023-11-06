import Foundation

// 상위 Teller Class
// method
// DepositTeller, LoanTeller
// Teller Class 상속
// 인원 수

class Teller {
    private let depositTellerCount: Int
    private let loanTellerCount: Int
    private let group = DispatchGroup()
    
    
    init(depositTellerCount: Int, loanTellerCount: Int) {
        self.depositTellerCount = depositTellerCount
        self.loanTellerCount = loanTellerCount
    }
    
    private func categorizeTask(queue: Queue<Int>, count: Int) {
        let name = queue.getType().name
        let time = queue.getType().time
        
        let semaphore = DispatchSemaphore(value: count)
        let group = DispatchGroup()
        
        for n in 1...count {
            group.enter()
            DispatchQueue.global().async {
                while !queue.isEmpty() {
                    semaphore.wait()
                    guard let data = queue.dequeue() else { return }
                    print("\(name) 은행원 \(n) \(data)번 고객 \(name)업무 시작")
                    usleep(time)
                    print("\(name) 은행원 \(n) \(data)번 고객 \(name)업무 완료")
                    semaphore.signal()
                }
                group.leave()
            }
        }
        group.wait()
    }
    
    func doTask(depositCustomerQueue: Queue<Int>, loanCustomerQueue: Queue<Int>) {
        groupingTask(queue: depositCustomerQueue, count: depositTellerCount)
        groupingTask(queue: loanCustomerQueue, count: loanTellerCount)
        group.wait()
    }
    
    func groupingTask(queue: Queue<Int>, count: Int) {
        group.enter()
        DispatchQueue.global().async {
            self.categorizeTask(queue: queue, count: count)
            self.group.leave()
        }
        
    }
    
}

struct Tellers {
    private let depositTellerCount: Int
    private let loanTellerCount: Int
    private let group = DispatchGroup()
    
    
    init(depositTellerCount: Int, loanTellerCount: Int) {
        self.depositTellerCount = depositTellerCount
        self.loanTellerCount = loanTellerCount
    }
    
    private func categorizeTask(queue: Queue<Int>, count: Int) {
        let name = queue.getType().name
        let time = queue.getType().time
        
        let semaphore = DispatchSemaphore(value: count)
        let group = DispatchGroup()
        
        for n in 1...count {
            group.enter()
            DispatchQueue.global().async {
                while !queue.isEmpty() {
                    semaphore.wait()
                    guard let data = queue.dequeue() else { return }
                    print("\(name) 은행원 \(n) \(data)번 고객 \(name)업무 시작")
                    usleep(time)
                    print("\(name) 은행원 \(n) \(data)번 고객 \(name)업무 완료")
                    semaphore.signal()
                }
                group.leave()
            }
        }
        group.wait()
    }
    
    func doTask(depositCustomerQueue: Queue<Int>, loanCustomerQueue: Queue<Int>) {
        groupingTask(queue: depositCustomerQueue, count: depositTellerCount)
        groupingTask(queue: loanCustomerQueue, count: loanTellerCount)
        group.wait()
    }
    
    func groupingTask(queue: Queue<Int>, count: Int) {
        group.enter()
        DispatchQueue.global().async {
            categorizeTask(queue: queue, count: count)
            group.leave()
        }
        
    }
    
}
