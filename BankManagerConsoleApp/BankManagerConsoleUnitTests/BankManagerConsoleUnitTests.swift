@testable import BankManagerConsoleApp
import XCTest

final class BankManagerConsoleUnitTests: XCTestCase {

    var sut: LinkedList<String>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_값을_처음_추가하면_헤드가_존재해야_한다() {
        // given
        let element = "3"
        
        // when
        sut.appendNode(value: element)
        
        // then
        XCTAssertEqual(sut.isEmpty, false)
    }
    
    func test_노드가_두개이상일때_removeFirst를하면_두번째노드가_헤드가_된다() {
        // given
        sut.appendNode(value: "1")
        sut.appendNode(value: "폴")
        
        // when
        sut.removeFirst()
        
        // then
        XCTAssertEqual(sut.head?.value, "폴")
    }
}
