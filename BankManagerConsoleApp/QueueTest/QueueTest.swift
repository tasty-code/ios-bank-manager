//
//  QueueTest.swift
//  QueueTest
//
//  Created by 박도원 on 2022/10/12.
//

import XCTest

final class QueueTest: XCTestCase {
    var list = LinkedList<Int>()
    var queueList = Queue<Int>()

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_LinkedList테스트() {
        list.addLast(data: 3)
        list.addLast(data: 4)
        
        let returnFirstValue = list.returnFirstValue
        
        XCTAssertEqual(returnFirstValue, 3)
    }
    
    func test_Queue_peek테스트() {
        queueList.enqueue(data: 3)
        queueList.enqueue(data: 4)
        queueList.enqueue(data: 4)
        
        print(queueList.count)
        
        let peek = queueList.peek
        
       XCTAssertEqual(peek, 3)
    }
    
    func test_Queue_dequeue테스트() {
        queueList.enqueue(data: 3)
        
        let dequeue = queueList.dequeue()
        print(queueList.count)
        
        XCTAssertEqual(dequeue, 3)
    }
    
    func test_Queue_clear테스트() {
        queueList.enqueue(data: 3)
        queueList.enqueue(data: 4)
        queueList.clear()
        
        print(queueList.count)
        
        let clear = queueList.isEmpty
        
        XCTAssertTrue(clear)
    }

}
