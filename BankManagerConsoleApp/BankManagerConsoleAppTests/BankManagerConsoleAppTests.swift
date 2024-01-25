
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
    
    func test_enqueue가_Queue에_제대로_노드를_추가하는가_count방법() {
        //given
        let node = Node(value: "2")
        
        //when
        sut.enqueue(node: node)
        let result = sut.linkedList.count
        
        //then
        XCTAssertEqual(1, result, "예상되는 값은 1")
    }
    
    func test_enqueue가_Queue에_제대로_노드를_추가하는가_값확인방법() {
        //given
        let node1 = Node(value: "3")
        let node2 = Node(value: "4")
        let node3 = Node(value: "5")
        
        //when
        sut.enqueue(node: node1)
        sut.enqueue(node: node2)
        sut.enqueue(node: node3)
        let lastNode = sut.linkedList[2]?.value
        
        //then
        XCTAssertEqual("5", lastNode, "예상되는 값은 5")
    }
    
    func test_dequeue가_Queue의_노드를_제대로_삭제하는가() {
            //given
            let node1: Node = Node(value: "6")
            let node2: Node = Node(value: "7")
            let node3: Node = Node(value: "8")
            sut.enqueue(node: node1)
            sut.enqueue(node: node2)
            sut.enqueue(node: node3)
            
            //when
            sut.dequeue()
            let headNode: String? = sut.linkedList[0]?.value

            //then
            XCTAssertEqual("7", headNode, "예상되는 값은 7")
    }
    
    func test_peek가_첫번째_노드를_돌려주는가() {
        // given
        let expectation = "100"
        let result: String

        // when
        sut.enqueue(node: Node(value: "100"))
        sut.enqueue(node: Node(value: "101"))
        result = sut.peek()!.value
        // then
        XCTAssertEqual(expectation, result, "예상되는 값은 100")
    }
    
    func test_clear가_큐를_삭제하는가() {
        // given
        let expectation: Int = 0
        let result: Int
        
        // when
        sut.enqueue(node: Node(value: "100"))
        sut.enqueue(node: Node(value: "101"))
        sut.enqueue(node: Node(value: "102"))
        sut.clear()
        result = sut.linkedList.count
        
        // then
        XCTAssertEqual(expectation, result, "예상되는 count는 0")
    }
}
