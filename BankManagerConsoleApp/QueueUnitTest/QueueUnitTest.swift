//
//  QueueUnitTest.swift
//  QueueUnitTest
//
//  Created by 김준성 on 10/30/23.
//

import XCTest

final class QueueUnitTest: XCTestCase {
    var queue: Queue<Int>!
    
    override func setUpWithError() throws {
        queue = Queue<Int>()
    }
    
    override func tearDownWithError() throws {
        queue = nil
    }
    
    func test_Dequeue가_제대로_되는지() {
        // given
        var array = [Int]()
        for _ in 1...100 {
            let number = Int.random(in: -1000...1000)
            array.append(number)
            queue.enqueue(number)
        }
        
        // then
        for number in array {
            XCTAssertEqual(number, queue.dequeue())
        }
    }
    
    func test_Peek이_제대로_되는지() {
        // given
        var array = [Int]()
        for _ in 0..<10 {
            let number = Int.random(in: -1999...1999)
            array.append(number)
            queue.enqueue(number)
        }
        
        // when
        let randomNumber = Int.random(in: 0..<10)
        for _ in 0..<randomNumber {
            let _ = queue.dequeue()
        }
        
        // then
        XCTAssertEqual(queue.peek, array[randomNumber])
    }
    
    func test_빈_배열일_때_Peek이_제대로_되는지() {
        // then
        XCTAssertNil(queue.peek)
    }
    
    func test_isEmpty가_제대로_되는지() {
        // then
        XCTAssertTrue(queue.isEmpty)
        
        // given
        queue.enqueue(0)
        
        // then
        XCTAssertFalse(queue.isEmpty)
    }
    
    func test_Clear가_제대로_되는지() {
        // given
        for _ in 0..<Int.random(in: 1...10) {
            queue.enqueue(Int.random(in: 0...100))
        }
        
        // when
        queue.clear()
        
        // then
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.peek)
    }
    
    func test_Queue1() {
        var q1 = Queue<Int>()
        for _ in 0..<10_000_000 {
            q1.enqueue(Int.random(in: -1000...1000))
        }
        for _ in 0..<400_000 {
            let _ = q1.dequeue()
        }
        XCTAssertFalse(q1.isEmpty)
    }
    
    func test_Queue_종합테스트() {
        // given
        let array = [20, 1, 3, 45, 6, 7, 52, 43, 6, 756]
        
        // when
        for number in array {
            queue.enqueue(number)
        }
        
        // then
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.peek, array.first)
        XCTAssertEqual(queue.dequeue(), array.first)
        
        // when
        queue.clear()
        
        //then
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.dequeue())
        XCTAssertNil(queue.peek)
    }
}
