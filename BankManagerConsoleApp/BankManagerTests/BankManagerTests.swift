import XCTest

@testable import BankManagerConsoleApp

final class BankManagerTests: XCTestCase {
    var sut: QueueManager!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = QueueManager()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐에_아무것도_없을_때_dequeue() {
        let queue = sut.getQueue()
        queue.dequeue()
        let result = queue.peek()
        XCTAssertNil(result)
    }
    
    func test_큐에_아무것도_없을_때_peek() {
        let queue = sut.getQueue()
        let result = queue.peek()
        XCTAssertNil(result)
    }
    
    func test_큐에_아무것도_없을_때_isEmpty() {
        let queue = sut.getQueue()
        let result = queue.isEmpty()
        XCTAssertTrue(result)
    }
    
    func test_큐에_대기하는_사람이_0명일_때_enqueue() {
        let queue = sut.getQueue()
        let customer = Customer(id: 999)
        queue.enqueue(customer)
        let result = queue.peek()
        
        guard let id = result?.id else { return }
        
        XCTAssertEqual(id, 999)
    }
    
    func test_큐에_대기하는_사람이_1명일_때_clear() {
        let queue = sut.getQueue()
        let customer = Customer(id: 999)
        queue.enqueue(customer)
        queue.clear()
        let result = queue.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func test_큐에_대기하는_사람이_1명일_때_dequeue() {
        let queue = sut.getQueue()
        let customer = Customer(id: 999)
        queue.enqueue(customer)
        queue.dequeue()
        let result = queue.peek()
        
        XCTAssertNil(result)
    }
    
    func test_큐에_대기하는_사람이_8명일_때_6명_dequeue_결과() {
        let queue = sut.getQueue()
        
        let queueData : [Int] = [111, 222, 333, 444, 555, 666, 777, 888]
        queueData.forEach {
            queue.enqueue(Customer(id: $0))
        }
        
        for _ in 1...6 {
            queue.dequeue()
        }
        
        let result = queue.peek()
        guard let id = result?.id else { return }
        XCTAssertEqual(id, 777)
    }
}
