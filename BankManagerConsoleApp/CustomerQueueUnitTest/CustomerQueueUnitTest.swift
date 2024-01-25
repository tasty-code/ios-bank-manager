//
//  CustomerQueueUnitTest.swift
//  CustomerQueueUnitTest
//
//  Created by 김동준 on 1/25/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class CustomerQueueUnitTest: XCTestCase {

    var customerQueue = CustomerQueue<Int>()
    
    override func setUp() {
    }
    
    override func tearDown() {
        print("큐 값 : \(customerQueue.list.description)")
    }
    
    func test_큐에_dequeue를_했을때_첫번째값_삭제후_반환() {
        //given
        customerQueue.enqueue(value: 1)
        customerQueue.enqueue(value: 2)
        
        //when
        let result = customerQueue.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_isEmpty메서드_호출시_노드가_없어서_트루를_반환() {
        //then
        XCTAssertTrue(customerQueue.isEmpty())
    }
    
    func test_클리어_메서드_호출시_모든_노드가_사라지고_isEmpty가_트루_반환() {
        //given
        customerQueue.enqueue(value: 1)
        customerQueue.enqueue(value: 2)
        customerQueue.enqueue(value: 3)
        
        //when
        customerQueue.clear()
        
        //then
        XCTAssertEqual(customerQueue.isEmpty(), true)
    }
    
    func test_큐를_enqeueue했을때_노드가_있기때문에_queue의_isEmpty반환_값이_false() {
        //given
        customerQueue.enqueue(value: 5)
        
        //then
        XCTAssertFalse(customerQueue.isEmpty())
    }
    
    func test_peek했을때_처음노드의_값을_가져오는데_그_값이_1이다() {
        //given
        customerQueue.enqueue(value: 1)
        
        //then
        XCTAssertEqual(customerQueue.peek(), 1)
    }
    
    func test_노드가_아무것도_없을때_디큐_하면_nil을_반환한다() {
        //then
        XCTAssertNil(customerQueue.dequeue())
    }
    
    func test_노드가_아무것도_없을때_peek하면_nil을_반환한다() {
        //then
        XCTAssertNil(customerQueue.peek())
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
