import Foundation

class Tellers {
    private let tellerCount: Int
    private let tellerType: TypeOfWork
    
    var arr1: [Int] = []
    var arr2: [Int] = []
    
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
        
        var restTeller: [Int] = Array(1...tellerCount)
        
        while !queue.isEmpty() {
            semaphore.wait()
            guard let data = queue.dequeue() else { return }
            
            if workingTellerCount < tellerCount {
                let currentTellerCount = restTeller.removeFirst()
                group.enter()
                DispatchQueue.global().async { [self] in
                    workingTellerCount += 1
                    print("\(name) 은행원 \(currentTellerCount) \(data)번 고객 \(name)업무 시작")
                    currentTellerCount == 1 ? arr1.append(data) : arr2.append(data)
                    usleep(time)
                    print("\(name) 은행원 \(currentTellerCount) \(data)번 고객 \(name)업무 완료")
                    restTeller.append(currentTellerCount)
                    workingTellerCount -= 1
                    semaphore.signal()
                    group.leave()
                }
            }
        }
        group.wait()
    }
}
