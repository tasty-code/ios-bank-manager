import Foundation

struct Teller {
    private let tellerCount: Int
    private let semaphore = DispatchSemaphore(value: 1)
    private let normalTask = DispatchGroup()
    
    init(tellerCount: Int) {
        self.tellerCount = tellerCount
    }

    func doTask(queue: Queue<Int>, customer: Int,group: DispatchGroup) {
        for n in 1...tellerCount {
            DispatchQueue.global().async {
                while !queue.isEmpty() {
                    semaphore.wait()
                    guard let data = queue.dequeue() else { return }
                    print("\(n) \(data)번 고객 업무 시작")
                    usleep(700000)
                    print("\(n) \(data)번 고객 업무 완료 \n")
                    semaphore.signal()

                }
                group.leave()
            }
        }
    }
    
}
