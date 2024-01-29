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
        let dequeueValue = sut.dequeue()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_여러개의_노드를_enqueue를_하고_dequeue하면_헤드의_값과_두번째_노드의_값이_같아야_한다() {
        // given
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        
        let dequeueValue = sut.dequeue()
        
        XCTAssertEqual(2, sut.peek)
    }
    
    func test_노드를_enqueue하고_dequeue하면_리스트가_nil이_되어야한다() {
        // given
        sut.enqueue(value: 1)
        
        // when
        let dequeueValue = sut.dequeue()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_1을_리스트에_추가하고_dequeue를하면_dequeue된_값은_1_된다() {
        // given
        sut.enqueue(value: 1)
        
        // when
        let dequeueValue = sut.dequeue()
        
        // then
        XCTAssertEqual(dequeueValue, 1)
    }
    
    func test_리스트가_비어있을때_dequeue를하면_dequeue된_값은_nil이_된다() {
        // given
        let list = sut.isEmpty
        
        // when
        let dequeueValue = sut.dequeue()
        
        // then
        XCTAssertNil(dequeueValue)
    }
    
    
    // MARK: - clear
    func test_클리어시_모든노드가_메모리에서_해제되는지() {
        // given
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        sut.enqueue(value: 4)
        
        // when
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}
