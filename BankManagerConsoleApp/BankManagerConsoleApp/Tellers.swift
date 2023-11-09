import Foundation

struct Tellers {
    private let tellerCount: Int
    private let tellerType: TypeOfWork
    
    init(tellerCount: Int, tellerType: TypeOfWork) {
        self.tellerCount = tellerCount
        self.tellerType = tellerType
    }

    func doTask(queue: Queue<Int>) {
        let name = tellerType.name
        let time = tellerType.time
        
        let semaphore = DispatchSemaphore(value: tellerCount)
        let group = DispatchGroup()
        var workingTellerCount = 0
        
        while !queue.isEmpty() {
            semaphore.wait()
            guard let data = queue.dequeue() else { return }

            if workingTellerCount < tellerCount {
                group.enter()
                DispatchQueue.global().async {
                    workingTellerCount += 1
                    print("\(name) 은행원 \(data)번 고객 \(name)업무 시작")
                    usleep(time)
                    print("\(name) 은행원 \(data)번 고객 \(name)업무 완료")
                    workingTellerCount -= 1
                    semaphore.signal()
                    group.leave()
                }
            }
        }
        group.wait()
    }
}
