@testable import BankManagerConsoleApp
import XCTest

final class LinkedListTest: XCTestCase {

    var sut: LinkedList<String>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - append
    func test_첫_노드를_추가하면_리스트가_비어있지_않아야_한다() {
        // given
        sut.appendNode(value:  "3")
        
        // then
        XCTAssertEqual(sut.isEmpty, false)
    }

    func test_첫_노드를_추가하면_헤드의_값과_같아야_한다() {
        // given
        sut.appendNode(value: "1")
        
        // then
        XCTAssertEqual(sut.headValue, "1")
    }
    
    // MARK: - removeFirst
    func test_노드가_두개이상일때_removeFirst를하면_두번째노드가_헤드가_된다() {
        // given
        sut.appendNode(value: "1")
        sut.appendNode(value: "폴")
        
        // when
        sut.removeFirst()
        
        // then
        XCTAssertEqual(sut.head?.value, "폴")
    }
    
    // MARK: - clear
    func test_노드를추가하고_클리어를_했을때_head와_tail이_nil이어야_한다() {
        // given
        sut.appendNode(value: "1")
        sut.appendNode(value: "2")
        sut.appendNode(value: "3")
        
        // when
        sut.clear()
        
        // then
        XCTAssertEqual(sut.head == nil, true)
        XCTAssertEqual(sut.tail == nil, true)
    }
    
    func test_노드를추가하고_클리어를_했을때_노드의_다음값이_없어야_한다() {
        // given
        sut.appendNode(value: "1")
        sut.appendNode(value: "2")
        sut.appendNode(value: "3")
        
        // when
        sut.clear()
        
        // then
        XCTAssertEqual(sut.head?.next == nil, true)
    }

}
