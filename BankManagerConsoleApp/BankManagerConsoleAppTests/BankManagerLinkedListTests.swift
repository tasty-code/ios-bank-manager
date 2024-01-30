
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

