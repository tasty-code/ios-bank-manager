//
//  BankManagerConsoleAppTest.swift
//  BankManagerConsoleAppTest
//
//  Created by dopamint on 1/25/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTest: XCTestCase {

    var queue = Queue<Int>()

    // MARK: - enqueue
    func test_queue에enqueue호출_시queue에추가되는지() {
        queue.enqueue(1)
        let peek = queue.peek()
        let result = 1
        XCTAssertEqual(result, peek)
    }

    // MARK: - dequeue
    func test_queue에dequeue호출시맨앞의값이반환되는지() {
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        let dequeueValue = queue.dequeue()
        XCTAssertEqual(dequeueValue, Optional(2))
    }

    // MARK: - peek
    func test_queue에peek호출시첫번째노드의값을_반환하는지() {
        queue.enqueue(5)
        queue.enqueue(6)
        queue.enqueue(7)
        let result = queue.peek()
        XCTAssertEqual(result, 5)
    }

    // MARK: - isEmpty
    func testqueue가비어있을때isEmpty호출_시true를반환하는지() {
        let result = queue.isEmpty()
        XCTAssertTrue(result)
    }

}
