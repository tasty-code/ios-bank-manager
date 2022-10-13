//
//  QueueTest.swift
//  QueueTest
//
//  Created by 박도원 on 2022/10/12.
//

import XCTest

final class QueueTest: XCTestCase {
    var list = LinkedList<Int>()
    var queue = Queue<Int>()

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_LinkedList테스트() {
        list.append(data: 3)
        list.append(data: 4)
        
        let returnFirstValue = list.returnFirstValue()
        
        XCTAssertEqual(returnFirstValue, 3)
    }
    
    func test_Queue_peek테스트() {
        queue.enqueue(data: 3)
        queue.enqueue(data: 4)
        
        let peek = queue.peek
        
       XCTAssertEqual(peek, 3)
    }
    
    func test_Queue_dequeue테스트() {
        queue.enqueue(data: 3)
        queue.enqueue(data: 4)
        
        let dequeue = queue.dequeue()
        
        XCTAssertEqual(dequeue, 3)
    }
    
    func test_Queue_clear테스트() {
        queue.enqueue(data: 3)
        queue.enqueue(data: 4)
        queue.clear()
        
        let clear = queue.isEmpty
        
        XCTAssertTrue(clear)
    }

}
