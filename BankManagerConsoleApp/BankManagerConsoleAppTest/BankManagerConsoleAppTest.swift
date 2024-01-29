//
//  BankManagerConsoleAppTest.swift
//  BankManagerConsoleAppTest
//
//  Created by yujaehong on 1/25/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTest: XCTestCase {

    var queue = Queue<Int>()
        
        // MARK: - enqueue
        func test_queue에_enqueue_호출_시_queue에_추가되는지() {
            queue.enqueue(1)
            let peek = queue.peek()
            let result = 1
            XCTAssertEqual(result, peek)
        }
        
        // MARK: - dequeue
        func test_queue에_dequeue_호출_시_맨앞의_값이_반환되는지() {
            queue.enqueue(2)
            queue.enqueue(3)
            queue.enqueue(4)
            let dequeueValue = queue.dequeue()
            XCTAssertEqual(dequeueValue, Optional(2))
        }
        
        // MARK: - peek
        func test_queue에_peek_호출_시_첫번째_노드의_값을_반환하는지() {
            queue.enqueue(5)
            queue.enqueue(6)
            queue.enqueue(7)
            let result = queue.peek()
            XCTAssertEqual(result, 5)
        }
        
        // MARK: - isEmpty
        func test_queue가_비어있을때_isEmpty_호출_시_true를_반환하는지() {
            let result = queue.isEmpty()
            XCTAssertTrue(result)
        }

}
