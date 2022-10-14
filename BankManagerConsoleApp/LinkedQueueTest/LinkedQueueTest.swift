//
//  QueueTest.swift
//  QueueTest
//
//  Created by 정재근 on 2022/10/11.
//

import XCTest
@testable import BankManagerConsoleApp

class LinkedQueueTest: XCTestCase {
    var linkedQueue: Queue<Int>?

    override func setUpWithError() throws {
        try super.setUpWithError()
        linkedQueue = Queue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        linkedQueue = nil
    }

    func test_enqueue() {
        let result = 1
        
        linkedQueue?.enqueue(1)

        XCTAssertEqual(linkedQueue?.peek, result)
    }

    func test_dequeue() {
        let result = 1
        
        linkedQueue?.enqueue(1)

        XCTAssertEqual(linkedQueue?.dequeue(), result)
    }

    func test_peek() {
        let result = 1
        
        linkedQueue?.enqueue(1)

        XCTAssertEqual(linkedQueue?.peek, result)
    }

    func test_clear_isEmpty() {
        linkedQueue?.enqueue(1)
        linkedQueue?.enqueue(2)
        linkedQueue?.enqueue(3)

        linkedQueue?.clear()

        XCTAssertTrue(linkedQueue!.isEmpty)
    }
}
