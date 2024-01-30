
import XCTest
@testable import BankManagerConsoleApp

final class BankMangerLinkedListTests: XCTestCase {
    var sutLinkedTest: LinkedList<String>!
    
    override func setUpWithError() throws {
        sutLinkedTest = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sutLinkedTest = nil
    }

    func test_입력이1개일때_노드를1개추가하고삭제를1번하면_노드가없을것이다() {
        // given
        let input = "A"
        // when
        sutLinkedTest.appendNodeAtRear(with: input)
        let _ = sutLinkedTest.removeNodeFromFront()
        let result = sutLinkedTest.isData(with: nil)
        // then
        XCTAssertNil(result)
    }
    
    func test_입력이1개일때_노드를1개추가하고그값을조회하면_1번위치가반환된다() {
        // given
        let input = "A"
        let expectedResult = 1
        // when
        sutLinkedTest.appendNodeAtRear(with: input)
        let result = sutLinkedTest.isData(with: input)
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_입력이3개일때_노드를3개추가하고3번째값을조회하면_3번위치가반환된다() {
        // given
        let input = [ "A", "B", "C" ]
        let expectedResult = 3
        // when
        for data in input {
            sutLinkedTest.appendNodeAtRear(with: data)
        }
        let result = sutLinkedTest.isData(with: "C")
        // then
        XCTAssertEqual(expectedResult, result)
    }
}

