
import XCTest
@testable import BankManagerConsoleApp

final class BankManagerQueueTests: XCTestCase { // test_~일때_~하면_~할것이다
    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        sut = Queue<String>()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    
    func test_초기상태일때_대기열을확인하면_대기열이없을것이다() {
        // given
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_입력이1개있을때_enqueue를수행하면_대기열이있을것이다() {
        // given
        let input = "test"
        // when
        sut.enqueue(with: input)
        let result = sut.isEmpty
        // then
        XCTAssertFalse(result)
    }
    
    func test_입력이5개있을때_queue의길이를확인하면_길이가5일것이다() {
        // given
        let data = [ "A", "B", "C", "D", "E" ]
        let expectedLengthOfQueue = 5
        // when
        for input in data {
            sut.enqueue(with: input)
        }
        let result = sut.totalLength()
        // then
        XCTAssertEqual(expectedLengthOfQueue, result)
    }
    
    func test_입력이5개일때_enqueue를5번dequeue를4번하면_queue의길이가1일것이다() {
        // given
        let data = [ "A", "B", "C", "D", "E" ]
        let lengthOfQueue = 1
        let countOfDeque = 4
        // when
        for input in data {
            sut.enqueue(with: input)
        }
        for _ in 1...countOfDeque {
            let _ = sut.dequeue()
        }
        let result = sut.totalLength()
        // then
        XCTAssertEqual(lengthOfQueue, result)
    }
    
    func test_입력이5개일때_enqueue를5번dequeue3번하면_4번째데이터를정상적으로peek한다() {
        // given
        let data = [ "A", "B", "C", "D", "E" ]
        let countOfDeque = 3
        let expectedResult = data[countOfDeque]
        // when
        for input in data {
            sut.enqueue(with: input)
        }
        for _ in 1...countOfDeque {
            let _ = sut.dequeue()
        }
        let result = sut.peek()
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_초기상태일때_dequeue를1번수행하면_길이가0을유지한다() {
        // given
        let expectedCount = 0
        // when
        let _ = sut.dequeue()
        let result = sut.totalLength()
        // then
        XCTAssertEqual(expectedCount, result)
    }
    
    func test_초기상태일때_dequeue를한번수행하면_가져오는것이없을것이다() {
        // given
        // when
        let result = sut.dequeue()
        // then
        XCTAssertNil(result)
    }
    
    func test_dequeue한_데이터가_삭제된다() {
        // given
        let input = [ "First", "Second" ]
        for data in input {
            sut.enqueue(with: data)
        }
        let _ = sut.dequeue()
        // when
        let result = sut.peek() == "Second"
        // then
        XCTAssertTrue(result)
    }
    
    func test_dequeue시_삭제되는_첫데이터_확인() {
        // given
        let input = [ "First", "Second" ]
        for data in input {
            sut.enqueue(with: data)
        }
        //when
        let result = sut.dequeue() == "First"
        // then
        XCTAssertTrue(result)
    }
    
    func test_첫노드를_peek한다() {
        // given
        let input = [ "First", "Second" ]
        let expectedResult = "First"
        for data in input {
            sut.enqueue(with: data)
        }
        // when
        let result = sut.peek()
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_큐를_clear한다() {
        // given
        let input = [ "A", "B", "C", "D" ]
        for data in input {
            sut.enqueue(with: data)
        }
        let _ = sut.clean()
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_노드가_정상적으로_다음_노드를_연결한다() {
        // given
        let input = [ "A", "B", "C" ]
        let expectedResult = "C"
        for data in input {
            sut.enqueue(with: data)
        }
        // when
        let result = sut.linkedList.head?.next?.next?.data
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_tail의_다음_연결이_nil이다() {
        // given
        let input = [ "A", "B", "C" ]
        for data in input {
            sut.enqueue(with: data)
        }
        // when
        let result = sut.linkedList.tail?.next
        // then
        XCTAssertNil(result)
    }
}
