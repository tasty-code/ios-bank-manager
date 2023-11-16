import Foundation


struct Tellers {
    private let tellerCount: Int
    let tellerType: TypeOfWork
    let semaphore: DispatchSemaphore
    weak var del: Delegate?
    
    init(tellerCount: Int, tellerType: TypeOfWork) {
        self.tellerCount = tellerCount
        self.tellerType = tellerType
        self.semaphore = DispatchSemaphore(value: tellerCount)
    }
    
    func doTask(queue: Queue<Int>) {
        let name = tellerType.name
        let time = tellerType.time
        
        let group = DispatchGroup()
        
        while !queue.isEmpty() {
            
            guard let data = queue.dequeue() else { return }
           
            group.enter()
            semaphore.wait()
            DispatchQueue.global().async {
                del?.changeToLabelState(tellerType: tellerType, data: data)
//                print("\(name) 은행원 \(data)번 고객 \(name)업무 시작")
                usleep(time)
//                print("\(name) 은행원 \(data)번 고객 \(name)업무 완료")
                del?.removeLabel(data: data)
                semaphore.signal()
                group.leave()
            }
        }
        group.wait()
        del?.countReset()
    }
}
