
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
    
    func test_초기상태일때_dequeue를1번수행하면_가져오는것이없을것이다() {
        // given
        // when
        let result = sut.dequeue()
        // then
        XCTAssertNil(result)
    }
    
    func test_입력이2개일때_enqueue를2번dequeue를1번수행하면_peek되는값이second일것이다() {
        // given
        let input = [ "First", "Second" ]
        let expectedResult = "Second"
        // when
        for data in input {
            sut.enqueue(with: data)
        }
        let _ = sut.dequeue()
        let result = sut.peek()
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_입력이2개일때_enqueue를2번수행하면_dequeue한값이First일것이다() {
        // given
        let input = [ "First", "Second" ]
        let expectedResult = "First"
        //when
        for data in input {
            sut.enqueue(with: data)
        }
        let result = sut.dequeue()
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_입력이2개일때_enqueue를2번하고peek를하면_반환되는값이First일것이다() {
        // given
        let input = [ "First", "Second" ]
        let expectedResult = "First"
        // when
        for data in input {
            sut.enqueue(with: data)
        }
        let result = sut.peek()
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_입력이4개일때_enqueue를4번하고clean을하면_대기열이없을것이다() {
        // given
        let input = [ "A", "B", "C", "D" ]
        // when
        for data in input {
            sut.enqueue(with: data)
        }
        let _ = sut.clean()
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_입력이3개일때_enque를3번하면_head의다음다음노드가정상연결되고데이터를불러온다() {
        // given
        let input = [ "A", "B", "C" ]
        let expectedResult = "C"
        // when
        for data in input {
            sut.enqueue(with: data)
        }
        let result = sut.linkedList.head?.next?.next?.data
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_입력이3개일때_enqueue를3번하면_tail의다음연결이nil이다() {
        // given
        let input = [ "A", "B", "C" ]
        // when
        for data in input {
            sut.enqueue(with: data)
        }
        let result = sut.linkedList.tail?.next
        // then
        XCTAssertNil(result)
    }
}
