import Foundation

struct Banker: Identifiable, Hashable {
    var id: Int
    private(set) var task: String
    static let delay: Double = 0.7
    
    func work(_ queue: Queue<Customer>) {
        guard let customerCount = queue.peek()?.id else {
            return
        }
    
        print(Task.start(customerCount))
        
//        Thread.sleep(forTimeInterval: Banker.delay)
        queue.dequeue()
        
        print(Task.complete(customerCount))
    }
}
