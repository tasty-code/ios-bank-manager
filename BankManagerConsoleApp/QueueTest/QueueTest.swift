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

    func test_enqueue_하고_peek_하면_enqueue값과_peek값이_같아야한다() {
        // given
        sut.enqueue(value: 1)
        
        // when
        let peekValue = sut.peek
        
        // then
        XCTAssertEqual(1, peekValue)
    }
}
