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
    
    func test_enqueueTest() {
        let data = "test-data"
        sut.enqueue(data: data)
        XCTAssertEqual(sut.peek(), data, "thisTestFailed")
    }
    
    func test_dequeueTest() {
        sut.dequeue()
        XCTAssertNil(sut.peek(), "thisTestFailed")
    }
    
    func test_clearTest() {
        sut.clear()
        XCTAssertNil(sut.peek(), "thisTestFailed")
    }
    
    func test_peekCheckTest() {
        let data = "test-data"
        sut.enqueue(data: data)
        XCTAssertEqual(sut.peek(),data, "thisTestFailed")
    }
    
    func test_peekNilTest() {
        XCTAssertNil(sut.peek(), "thisTestFailed")
    }
    
    func test_isEmptyTrueTest() {
        XCTAssertTrue(sut.isEmpty(), "thisTestFailed")
    }
    
    func test_isEmptyFalseTest() {
        sut.enqueue(data: "test-data")
        XCTAssertFalse(sut.isEmpty(), "thisTestFailed")
    }
}
