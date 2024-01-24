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
        let element = "폴"
        
        // when
        sut.appendNode(value: element)
        
        // then
        XCTAssertEqual(sut.isEmpty, false)
    }

}
