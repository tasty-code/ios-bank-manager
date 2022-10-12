//
//  QueueUnitTest.swift
//  QueueUnitTest
//
//  Created by 문성진 on 2022/10/12.
//

import XCTest

@testable import BankManagerConsoleApp

final class QueueUnitTest: XCTestCase {

    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = Queue<Int>()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }

    func test_enqueue() {
        sut.enqueue(10)
        
        let result = sut.peek()
        
        XCTAssertEqual(result, 10)
    }
    
    func test_dequeue() {
        sut.enqueue(10)
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, 10)
    }
    
    func test_clesr() {
        sut.enqueue(10)
        sut.enqueue(20)
        sut.enqueue(15)
        sut.enqueue(5)
        
        sut.clear()
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_IsEmpty() {
        sut.enqueue(10)
        sut.enqueue(20)
        
        let result = sut.isEmpty
        XCTAssertFalse(result)
    }
    
    func test_Peek() {
        sut.enqueue(10)
        
        let result = sut.peek()
        
        XCTAssertEqual(result, 10)
    }

}
