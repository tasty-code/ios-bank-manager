//
//  CustomerQueueUnitTest.swift
//  CustomerQueueUnitTest
//
//  Created by 김동준 on 1/25/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class CustomerQueueUnitTest: XCTestCase {

    var customerQueue = CustomerQueue<Int>()
    
    override func setUp() {
        for i in 1...5 {
            customerQueue.enqueue(value: i)
        }
    }
    
    override func tearDown() {
        print(customerQueue.list.description)
    }
    
    func test_큐에_dequeue를_했을때_첫번째값_삭제후_반환() {
        let result = customerQueue.dequeue()
        XCTAssertEqual(result, 1)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
