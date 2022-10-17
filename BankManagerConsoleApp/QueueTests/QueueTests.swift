//
//  QueueTests.swift
//  QueueTests
//
//  Created by 세윤 on 2022/10/16.
//

import XCTest

final class QueueTests: XCTestCase {
    var queue = Queue<Int>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_2를_인큐했을_때_디큐하면_디큐한_값은_2다() {
        // given
        queue.enqueue(2)
        
        // when
        let dequeueInQueue = queue.dequeue()
        
        // then
        let result = 2
        XCTAssertEqual(dequeueInQueue, result)
    }
    
    func test_2를_인큐했을_때_이스엠티하면_이스엠티는_펠스이다() {
        // given
        queue.enqueue(2)
        
        // when
        let checkQueue = queue.isEmpty
        
        // then
        let result = false
        XCTAssertEqual(checkQueue, result)
    }
    
    func test_2를_인큐했을_때_피크하면_피크한_값은_2다() {
        // given
        queue.enqueue(2)
        
        // when
        let peekQueue = queue.peek
        
        // then
        let result = 2
        XCTAssertEqual(peekQueue, result)
    }
    
    func test_2를_인큐했을_때_클리어하면_이스엠티는_트루이다() {
        // given
        queue.enqueue(2)
        
        // when
        queue.clear()
        let checkQueue = queue.isEmpty
        
        // then
        let result = true
        XCTAssertEqual(checkQueue, result)
    }
    
}
