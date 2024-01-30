
import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTests: XCTestCase {
    var sut: Queue<String>!
    var sutLinkedTest: LinkedList<String>!
    
    override func setUpWithError() throws {
        sut = Queue<String>()
        sutLinkedTest = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        sutLinkedTest = nil
    }
    
    func test_queue에_노드가_없다() {
        // given
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_queue에_노드가_있다() {
        // given
        let input = "test"
        sut.enqueue(with: input)
        // when
        let result = sut.isEmpty
        // then
        XCTAssertFalse(result)
    }
    
    func test_queue에_노드가_다섯개_생성된다() {
        // given
        let data = [ "A", "B", "C", "D", "E" ]
        let expectedLengthOfQueue = 5
        for input in data {
            sut.enqueue(with: input)
        }
        // when
        let result = sut.totalLength()
        // then
        XCTAssertEqual(expectedLengthOfQueue, result)
    }
    
    func test_queue의_5번_enqueue_4번_dequeue_노드가_1개_남는다() {
        // given
        let data = [ "A", "B", "C", "D", "E" ]
        let lengthOfQueue = 1
        let countOfDeque = 4
        for input in data {
            sut.enqueue(with: input)
        }
        for _ in 1...countOfDeque {
            let _ = sut.dequeue()
        }
        // when
        let result = sut.totalLength()
        // then
        XCTAssertEqual(lengthOfQueue, result)
    }
    
    func test_queue의_5번_enqueue_3번_dequeue_남은_노드를_peek_한다() {
        // given
        let data = [ "A", "B", "C", "D", "E" ]
        let countOfDeque = 3
        let expectedResult = data[countOfDeque]
        for input in data {
            sut.enqueue(with: input)
        }
        for _ in 1...countOfDeque {
            let _ = sut.dequeue()
        }
        // when
        let result = sut.peek()
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_초기에_dequeue를_했을때_카운트가_0이다() {
        // given
        let expectedCount = 0
        let _ = sut.dequeue()
        // when
        let result = sut.totalLength()
        // then
        XCTAssertEqual(expectedCount, result)
    }
    
    func test_dequeue_시_반환되는_노드가_Nil이다() {
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
        for data in input {
            sut.enqueue(with: data)
        }
        // when
        let result = sut.peek() == "First"
        // then
        XCTAssertTrue(result)
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
    
    // MARK: 선택사항 - LinkedList 특정 데이터 검색구현
    func test_데이터가_하나도_없는데_데이터를_검색하는_경우() {
        // given
        sutLinkedTest.appendNodeAtRear(with: "A")
        let _ = sutLinkedTest.removeNodeFromFront()
        //when
        let result = sutLinkedTest.isData(with: nil)
        //then
        XCTAssertNil(result)
    }
    
    func test_데이터가_하나일때_데이터를_검색하는_경우() {
        // given
        let input = "A"
        let expectedResult = 1
        sutLinkedTest.appendNodeAtRear(with: input)
        // when
        let result = sutLinkedTest.isData(with: input)
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_데이터의_값이_A_B_C가_존재하는_경우_C를_검색() {
        // given
        let input = [ "A", "B", "C" ]
        let expectedResult = 3
        for data in input {
            sutLinkedTest.appendNodeAtRear(with: data)
        }
        // when
        let result = sutLinkedTest.isData(with: "C")
        // then
        XCTAssertEqual(expectedResult, result)
    }
}
