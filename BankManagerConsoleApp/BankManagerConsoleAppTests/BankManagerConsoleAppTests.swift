
import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTests: XCTestCase {

    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        sut = Queue(linkedList: LinkedList())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isEmpty가_Queue가_비어있을때_true를_반환하는가() {
        //given
        var result: Bool
        
        //when
        result = sut.isEmpty()
        
        //then
        XCTAssertTrue(result, "예상되는 값은 true")
    }
    
    func test_isEmpty가_Queue에_값이있을때_false를_반환하는가() {
        //given
        let node: Node = Node(value: "1")
        
        sut.enqueue(node: node)
        
        //when
        let result = sut.isEmpty()
        
        //then
        XCTAssertFalse(result, "예상되는 값은 false")
    }
}
