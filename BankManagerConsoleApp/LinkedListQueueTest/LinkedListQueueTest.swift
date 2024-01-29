//
//  LinkedListQueueTest.swift
//  LinkedListQueueTest
//
//  Created by Doyoung An on 1/25/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class LinkedListQueueTest: XCTestCase {
    /// 빈 큐를 생성하고 비어 있는지 확인하는 테스트
    func testEmptyQueue() {
        let queue = LinkedListQueue<Int>()
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.peek)
    }
    
    /// 큐에 요소를 추가하고 큐가 비어있지 않은지 확인하는 테스트
    func testEnqueue() {
        let queue = LinkedListQueue<Int>()
        queue.enqueue(1)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.peek, 1)
    }
    
    /// 큐에서 요소를 제거하고 큐가 비어 있는지 확인하는 테스트
    func testDequeue() {
        let queue = LinkedListQueue<Int>()
        queue.enqueue(1)
        let dequeuedElement = queue.dequeue()
        XCTAssertEqual(dequeuedElement, 1)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.peek)
    }
    
    /// 큐에 여러 요소를 추가하고 모두 제거하는 테스트
    func testMultipleEnqueueDequeue() {
        let queue = LinkedListQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)

        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.dequeue(), 3)

        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.peek)
    }
    
    /// 큐를 비우는 테스트
    func testClear() {
        let queue = LinkedListQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)

        queue.clear()

        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.peek)
    }
}
