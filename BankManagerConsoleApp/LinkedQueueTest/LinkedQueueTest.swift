//
//  LinkedQueueTest.swift
//  LinkedQueueTest
//
//  Created by 정재근 on 2022/10/11.
//

import XCTest
@testable import

final class LinkedQueueTest: XCTestCase {
    var linkedQueue: Queue<Int>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        linkedQueue = Queue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        linkedQueue = nil
    }
    func test_enqueue_peek() {
        let result = 1
        linkedQueue?.enqueue(1)
        
        XCTAssertEqual(linkedQueue?.peek, result)
    }
    
}
