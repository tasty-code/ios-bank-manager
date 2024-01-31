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
    
    func test_queue가_빈_상태에서_enqueue를_동작확인() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.enqueue(data: "test-data")
        let expected = sut.peek()
        
        // Then
        XCTAssertEqual(expected, "test-data")
    }
    
    func test_queue가_빈_상태에서_enqueue를_여러번_수행해도_첫_요소는_변경되지_않는다() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.enqueue(data: "test0")
        sut.enqueue(data: "test1")
        sut.enqueue(data: "test2")
        sut.enqueue(data: "test3")
        let expected = sut.peek()
        
        // Then
        XCTAssertEqual(expected, "test0")
    }
    
    func test_queue가_빈_상태에서_enqueue_dequeue_여러번_수행했을때_결과확인() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.enqueue(data: "test0")
        sut.dequeue()
        sut.enqueue(data: "test1")
        sut.dequeue()
        sut.enqueue(data: "test2")
        sut.dequeue()
        sut.enqueue(data: "test3")
        let expected = sut.peek()
        
        // Then
        XCTAssertEqual(expected, "test3")
    }
    
    func test_queue가_빈_상태에서_enqueue_dequeue_여러번_수행했을때_마지막에_dequeue실행() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.enqueue(data: "test0")
        sut.dequeue()
        sut.enqueue(data: "test1")
        sut.dequeue()
        sut.enqueue(data: "test2")
        sut.dequeue()
        let expected = sut.peek()
        
        // Then
        XCTAssertNil(expected)
    }
    
    func test_queue가_빈_상태에서_dequeue_동작확인() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.dequeue()
        let expected = sut.peek()
        
        // Then
        XCTAssertNil(expected)
    }
    
    func test_queue가_빈_상태에서_dequeue_데이터가_있을때_동작확인() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.enqueue(data: "test")
        let expected = sut.peek()
        
        // Then
        XCTAssertEqual(expected, "test")
    }
    
    func test_queue가_빈_상태에서_claer_동작확인() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.enqueue(data: "test")
        sut.clear()
        let expected = sut.peek()
        
        // Then
        XCTAssertNil(expected)
    }
    
    func test_queue가_빈_상태에서_여러개의_데이터를_enqueue하고_claer_동작확인() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.enqueue(data: "test0")
        sut.enqueue(data: "test1")
        sut.enqueue(data: "test2")
        sut.enqueue(data: "test3")
        sut.clear()
        let expected = sut.peek()
        
        // Then
        XCTAssertNil(expected)
    }
    
    func test_queue가_빈_상태에서_여러개의_데이터를_enqueue하고_dequeue의_연속_동작확인() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.enqueue(data: "test0")
        sut.enqueue(data: "test1")
        sut.enqueue(data: "test2")
        sut.enqueue(data: "test3")
        sut.dequeue()
        sut.dequeue()
        let expected = sut.peek()
        
        // Then
        XCTAssertEqual(expected, "test2")
    }
    
    func test_queue가_빈_상태에서_여러개의_데이터를_enqueue_동작확인() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.enqueue(data: "test0")
        sut.enqueue(data: "test1")
        sut.enqueue(data: "test2")
        sut.enqueue(data: "test3")
        let expected = sut.peek()
        
        // Then
        XCTAssertEqual(expected, "test0")
    }
    
    func test_queue가_빈_상태에서_clear_동작확인() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.clear()
        let expected = sut.peek()
        
        // Then
        XCTAssertNil(expected)
    }
    
    func test_queue가_빈_상태에서_peekCheck_동작확인() {
        // Given
        XCTAssertNil(sut.peek())
        
        // When
        sut.enqueue(data: "test-data")
        let expected = sut.peek()
        
        // Then
        XCTAssertEqual(expected, "test-data")
    }
    
    func test_peek_결과값_확인() {
        // Given
        
        // When
        let expected = sut.peek()
        
        // Then
        XCTAssertNil(expected)
    }
    
    func test_isEmptyTrue_결과값_확인() {
        // Given
        
        // When
        let expected = sut.isEmpty()
        
        // Then
        XCTAssertTrue(expected)
    }
    
    func test_isEmptyFalse_결과값_확인() {
        // Given
        
        // When
        sut.enqueue(data: "test-data")
        let expected = sut.isEmpty()
        
        // Then
        
        XCTAssertFalse(expected)
    }
}
