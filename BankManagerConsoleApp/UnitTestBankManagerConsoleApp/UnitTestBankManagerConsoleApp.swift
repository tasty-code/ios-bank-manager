import XCTest
@testable import BankManagerConsoleApp

final class UnitTestBankManagerConsoleApp: XCTestCase {
    
    var sut: Queue<String>! = nil
}

extension UnitTestBankManagerConsoleApp {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}

// MARK: - UnitTestBankManagerConsoleApp TestMethod
extension UnitTestBankManagerConsoleApp {
    
    func test_enqueue() {
        let data = "test-data"
        sut.enqueue(data: data)
        XCTAssertEqual(sut.peek(), data)
    }
    
    func test_enqueue_데이터가_여러개있을때_동작확인() {
        sut.enqueue(data: "test0")
        sut.enqueue(data: "test1")
        sut.enqueue(data: "test2")
        sut.enqueue(data: "test3")
        let result = sut.peek()
        XCTAssertEqual(result, "test0")
    }
    
    func test_enqueue_dequeue_반복_동작확인() {
        sut.enqueue(data: "test0")
        sut.dequeue()
        sut.enqueue(data: "test1")
        sut.dequeue()
        sut.enqueue(data: "test2")
        sut.dequeue()
        sut.enqueue(data: "test3")
        let result = sut.peek()
        XCTAssertEqual(result, "test3")
    }
    
    func test_enqueue_dequeue_반복_동작확인_dequeue마지막실행() {
        sut.enqueue(data: "test0")
        sut.dequeue()
        sut.enqueue(data: "test1")
        sut.dequeue()
        sut.enqueue(data: "test2")
        sut.dequeue()
        let result = sut.peek()
        XCTAssertNil(result)
    }
    
    func test_dequeue() {
        sut.dequeue()
        XCTAssertNil(sut.peek())
    }
    
    func test_dequeue_데이터가_있을때_동작확인() {
        sut.enqueue(data: "test")
        let result = sut.peek()
        XCTAssertEqual(result, "test")
    }
    
    func test_claer가_제대로_동작하는지() {
        sut.enqueue(data: "test")
        sut.clear()
        let result = sut.peek()
        XCTAssertNil(result)
    }
    
    func test_claer가_데이터가_여러개있어도_제대로_동작하는지() {
        sut.enqueue(data: "test0")
        sut.enqueue(data: "test1")
        sut.enqueue(data: "test2")
        sut.enqueue(data: "test3")
        sut.clear()
        let result = sut.peek()
    
        XCTAssertNil(result)
    }
    
    func test_dequeue_데이터가_여러개_있을때_dequeue_여러번동작확인() {
        sut.enqueue(data: "test0")
        sut.enqueue(data: "test1")
        sut.enqueue(data: "test2")
        sut.enqueue(data: "test3")
        sut.dequeue()
        sut.dequeue()
        let result = sut.peek()
        XCTAssertEqual(result, "test2")
    }
    
    func test_dequeue_데이터가_여러개_있을때_동작확인() {
        sut.enqueue(data: "test0")
        sut.enqueue(data: "test1")
        sut.enqueue(data: "test2")
        sut.enqueue(data: "test3")
        let result = sut.peek()
        XCTAssertEqual(result, "test0")
    }
    
    func test_clear() {
        sut.clear()
        XCTAssertNil(sut.peek())
    }
    
    func test_peekCheck() {
        let data = "test-data"
        sut.enqueue(data: data)
        XCTAssertEqual(sut.peek(),data)
    }
    
    func test_peekNil() {
        XCTAssertNil(sut.peek())
    }
    
    func test_isEmptyTrue() {
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_isEmptyFalse() {
        sut.enqueue(data: "test-data")
        XCTAssertFalse(sut.isEmpty())
    }
}
