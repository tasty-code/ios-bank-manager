import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTest: XCTestCase {
    
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
       try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

    }
    
    
//MARK: dequeue 확인
    
    func test_아무것도_enqueue를_안하고_dequeue를_하면_nil인가() {
    
       let result = sut.dequeue()

            
        XCTAssertNil(result)
    }
    
    func test_1_2_enqueue하고_1_dequeue하기() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        
        guard let result = sut.dequeue()?.data else { return }
        
        XCTAssertEqual(result, 1)
    }
    
    func test_1_2_enqueue하고_dequeue할때_2가_아니다() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        
        let result = sut.dequeue()
        
        XCTAssertNotEqual(result?.data, 2)
    }
    
    func test_1_2_enqueue하고_dequeue하면_head가_2를_향하나() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        
        sut.dequeue()
        let result = sut.dequeue()?.data
        XCTAssertEqual(result, 2)
    }
    
   
    

// MARK: peek확인
    func test_enqueue_아무것도_안하고_peek로_값이_있는지_확인() throws {
        XCTAssertNil(sut.peek())
    }
    
    func test_1_enqueue_하고_peek로_값이_있는지_확인() throws {
        
        sut.enqueue(data: 1)
        
        XCTAssertNotNil(sut.peek())
    }
    
    func test_1_enqueue_하고_peek로_값_확인() throws {
        
        sut.enqueue(data: 1)
        
        XCTAssertEqual(sut.peek(), 1)
    }
    
//MARK: clear
    
    func test_1_2_enqueue하고_안비어있다() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        

        let result = sut.peek()
        XCTAssertNotNil(result)
    }
    
    func test_1_2_3_enqueue하고_clear하면_비어있는가() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.enqueue(data: 3)
        
        sut.clear()
        let result = sut.peek()
        XCTAssertNil(result)
    }
    
    
    
    
// MARK: isEmpthy?
    func test_아무것도_추가안했을때_비어있을까() {
        XCTAssertTrue(sut.isEmpthy())
    }
    
    func test_1_추가했을때_안비어있나() {
        
        sut.enqueue(data: 1)
        
        XCTAssertFalse(sut.isEmpthy())
    }

}
