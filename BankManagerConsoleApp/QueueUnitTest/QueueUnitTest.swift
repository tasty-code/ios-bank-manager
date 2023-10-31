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
    
    // MARK: - Dequeue
    func test_큐가_비었을_때_nil을_리턴하는지() {
        XCTAssertNil(queue.dequeue())
    }
    
    func test_enqueue를_하고_dequeue를_했을_때_enqueue의_값을_리턴하는지() {
        // given
        let number = 10
        
        // when
        queue.enqueue(number)
        
        // then
        XCTAssertEqual(number, queue.dequeue())
    }
    
    func test_배열을_enqueue하고_모두_dequeue를_한_값들이_배열과_일치하는지() {
        // given
        let array = [3, 54, 123,67, 28]
        
        // when
        for number in array {
            queue.enqueue(number)
        }
        
        var dequeueList = [Int?]()
        while !queue.isEmpty {
            dequeueList.append(queue.dequeue())
        }
        
        // then
        XCTAssertEqual(array, dequeueList)
    }
    
    // MARK: - Peek
    func test_Peek이_큐의_첫번째_값을_반환하는지() {
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
    
    func test_빈_배열일_때_Peek이_nil을_반환하는지() {
        // then
        XCTAssertNil(queue.peek)
    }
    
    // MARK: - isEmpty
    func test_isEmpty가_제대로_되는지() {
        // given
        queue.enqueue(0)
        
        // then
        XCTAssertFalse(queue.isEmpty)
    }
    
    func test_빈_배열일_때_isEmpty가_False인지() {
        XCTAssertTrue(queue.isEmpty)
    }
    
    // MARK: - Clear
    func test_Clear했을_때_isEmpty가_true인지() {
        // given
        for _ in 0..<Int.random(in: 1...10) {
            queue.enqueue(Int.random(in: 0...100))
        }
        
        // when
        queue.clear()
        
        // then
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_Clear했을_때_peek이_nil인지() {
        // given
        for _ in 0..<Int.random(in: 1...10) {
            queue.enqueue(Int.random(in: 0...100))
        }
        
        // when
        queue.clear()
        
        // then
        XCTAssertNil(queue.peek)
    }
}
