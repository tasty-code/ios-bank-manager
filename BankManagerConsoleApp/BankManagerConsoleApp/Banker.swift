import Foundation

struct Banker<T>: Identifiable, Hashable {	
    var id: Int
    var task: String
    
    func takeTask(_ queue: Queue<T>) {
        guard let customerCount = queue.peek() as? Int else {
            return
        }
        
        print("\(customerCount)번 고객 업무 시작")
        
//        Thread.sleep(forTimeInterval: 0.7)
        queue.dequeue()                         
        
        print("\(customerCount)번 고객 업무 완료")
    }
}
