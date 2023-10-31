import XCTest

@testable import BankManagerConsoleApp

final class BankManagerTests: XCTestCase {
    var sut: BankManager<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BankManager<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐에_아무것도_없을_때_dequeue() {
        sut.makeQueue()
        let queue = sut.getQueue(index: 0)
        guard let queue = queue else { return }
        let result = queue.dequeue()
        XCTAssertNil(result)
    }
    
    func test_큐에_아무것도_없을_때_peek() {
        sut.makeQueue()
        let queue = sut.getQueue(index: 0)
        guard let queue = queue else { return }
        let result = queue.peek()
        XCTAssertNil(result)
    }
    
    func test_큐에_아무것도_없을_때_isEmpty() {
        sut.makeQueue()
        let queue = sut.getQueue(index: 0)
        guard let queue = queue else { return }
        let result = queue.isEmpty()
        XCTAssertTrue(result)
    }
    
    func test_큐에_대기하는_사람이_0명일_때_enqueue() {
        sut.makeQueue()
        let queue = sut.getQueue(index: 0)
        guard let queue = queue else { return }
        let node = Node(data: 999)
        queue.enqueue(node)
        let result = queue.peek()
        
        XCTAssertEqual(result, 999)
    }
    
    func test_큐에_대기하는_사람이_1명일_때_clear() {
        sut.makeQueue()
        let queue = sut.getQueue(index: 0)
        guard let queue = queue else { return }
        let node = Node(data: 999)
        queue.enqueue(node)
        queue.clear()
        let result = queue.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func test_큐에_대기하는_사람이_1명일_때_dequeue() {
        sut.makeQueue()
        let queue = sut.getQueue(index: 0)
        guard let queue = queue else { return }
        let node = Node(data: 999)
        queue.enqueue(node)
        queue.dequeue()
        let result = queue.peek()
        
        XCTAssertNil(result)
    }
    
    func test_큐에_대기하는_사람이_1명일_때_dequeue_결과() {
        sut.makeQueue()
        let queue = sut.getQueue(index: 0)
        guard let queue = queue else { return }
        let node = Node(data: 999)
        queue.enqueue(node)
        let result = queue.dequeue()
        
        XCTAssertEqual(result, 999)
    }
    
    func test_큐에_대기하는_사람이_8명일_때_6명_dequeue_결과() {
        sut.makeQueue()
        let queue = sut.getQueue(index: 0)
        guard let queue = queue else { return }
        
        let queueData : [Int] = [111, 222, 333, 444, 555, 666, 777, 888]
        queueData.forEach {
            queue.enqueue(Node(data: $0))
        }
        
        for _ in 1...6 {
            queue.dequeue()
        }
        
        let result = queue.peek()
        XCTAssertEqual(result, 777)
    }
}
