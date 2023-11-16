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
        let time = tellerType.time
        
        let group = DispatchGroup()
        
        while !queue.isEmpty() {
            
            guard let data = queue.dequeue() else { return }
            
            group.enter()
            semaphore.wait()
            DispatchQueue.global().async {
                del?.changeToLabelState(tellerType: tellerType, data: data)
                
                usleep(time)
                
                del?.removeLabel(data: data)
                semaphore.signal()
                group.leave()
            }
        }
        group.wait()
        del?.countReset()
    }
}
