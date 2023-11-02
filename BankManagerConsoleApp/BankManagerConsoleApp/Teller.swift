import Foundation

struct Teller {
    private let tellerCount: Int
    private let semaphore = DispatchSemaphore(value: 1)
    private let normalTask = DispatchGroup()
    
    init(tellerCount: Int) {
        self.tellerCount = tellerCount
    }
    
    
    
    func doTask(queue: Queue<Int>, customer: Int) {
        for n in 1...tellerCount {
            DispatchQueue.global().async(group: normalTask) {
                for _ in 1...(customer / tellerCount) {
                    semaphore.wait()
                    guard let data = queue.peek() else { return }
                    print("\(n)번 은행원 \(data)번 고객 업무 시작")
                    usleep(700000)
                    let _ = queue.dequeue()
                    print("\(n)번 은행원 \(data)번 고객 업무 완료 \n")
                    semaphore.signal()
                }
            }
        }
        normalTask.wait()
    }
}
