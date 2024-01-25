@testable import BankManagerConsoleApp
import XCTest

final class QueueTest: XCTestCase {
    
    var sut: Queue<Int>!

    override func setUpWithError() throws {
        sut = Queue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - enqueue
    func test_enqueue_하고_peek_하면_enqueue값과_peek값이_같아야한다() {
        // given
        sut.enqueue(value: 1)
        
        // when
        let peekValue = sut.peek
        
        // then
        XCTAssertEqual(1, peekValue)
    }
    
    func test_edqueue하면_리스트가_비어있지_않아야_한다() {
        // given
        sut.enqueue(value: 1)
        
        //then
        XCTAssertFalse(sut.isEmpty)
    }
    
    // MARK: - dequeue
    func test_리스트가_비어있을때_dequeue를_하면_nil_이어야한다() {
        // given
        sut.dequeue()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_여러개의_노드를_enqueue를_하고_dequeue하면_헤드의_값과_두번째_노드의_값이_같아야_한다() {
        // given
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        
        sut.dequeue()
        
        XCTAssertEqual(2, sut.peek)
    }
    
    func test_노드를_enqueue하고_dequeue하면_리스트가_nil이_되어야한다() {
        // given
        sut.enqueue(value: 1)
        
        // when
        sut.dequeue()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}
