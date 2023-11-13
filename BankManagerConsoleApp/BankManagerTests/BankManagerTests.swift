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
    
    func insertCustomer(until customerCount: Int) -> Queue<Customer> {
        let queue = sut.getQueue()
        
        if customerCount <= 0 {
            return queue
        }
        
        for index in 1...customerCount {
            let newCustomer = Customer(orderNumber: index, task: DepositTask.self)
            
            queue.enqueue(newCustomer)
        }
        
        return queue
    }
    
    func test_큐에_아무것도_없을_때_dequeue() {
        let queue = insertCustomer(until: 0)
        queue.dequeue()
        let result = queue.peek()
        XCTAssertNil(result)
    }
    
    func test_큐에_아무것도_없을_때_peek() {
        let queue = insertCustomer(until: 0)
        let result = queue.peek()
        XCTAssertNil(result)
    }
    
    func test_큐에_아무것도_없을_때_isEmpty() {
        let queue = insertCustomer(until: 0)
        let result = queue.isEmpty()
        XCTAssertTrue(result)
    }
    
    func test_큐에_대기하는_사람이_0명일_때_enqueue() {
        let queue = insertCustomer(until: 1)
        let result = queue.peek()
        
        guard let orderNumber = result?.orderNumber else { return }
        
        XCTAssertEqual(orderNumber, 1)
    }
    
    func test_큐에_대기하는_사람이_1명일_때_clear() {
        let queue = insertCustomer(until: 1)
        queue.clear()
        let result = queue.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func test_큐에_대기하는_사람이_1명일_때_dequeue() {
        let queue = insertCustomer(until: 1)
        queue.dequeue()
        let result = queue.peek()
        
        XCTAssertNil(result)
    }
    
    func test_큐에_대기하는_사람이_8명일_때_6명_dequeue_결과() {
        let queue = insertCustomer(until: 6)

        for _ in 1...6 {
            queue.dequeue()
        }
        
        let result = queue.peek()
        guard let orderNumber = result?.orderNumber else { return }
        XCTAssertEqual(orderNumber, 7)
    }
}
