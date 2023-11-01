//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by Wonji Ha on 2023/10/30.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTests: XCTestCase {
    private var intQueue: Queue<Int>!
    private var stringQueue: Queue<String>!
    private var doubleQueue: Queue<Double>!
    private var customerQueue: Queue<Customer>!
    
    override func setUpWithError() throws {
        self.intQueue = Queue<Int>()
        self.stringQueue = Queue<String>()
        self.doubleQueue = Queue<Double>()
    }
    
    override func tearDownWithError() throws {
        self.intQueue = nil
        self.stringQueue = nil
        self.doubleQueue = nil
    }
    
    func test_10추가하기() {
        // given
        let num = 10
        
        // when
        intQueue.enqueue(num)
        
        // then
        XCTAssertNotNil(intQueue.peek())
    }
    
    func test_15빼보기() {
        // given
        let num = 15
        intQueue.enqueue(num)
        
        // when
        let result = intQueue.dequeue()
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_요소확인하기() {
        // given
        let array = [10, 20, 30]
        for item in array {
            intQueue.enqueue(item)
        }
        
        // when
        let result = intQueue.check()
        
        // then
        XCTAssertEqual(array, result)
    }
    
    func test_청소하기() {
        // given
        let num = 5
        intQueue.enqueue(num)
        
        // when
        intQueue.clear()
        
        // then
        let result = intQueue.check()
        XCTAssertEqual([], result)
    }
    
    func test_String큐_청소하기() {
        // given
        let word = "MacOS"
        stringQueue.enqueue(word)
        
        // when
        stringQueue.clear()
        
        // then
        let result = stringQueue.check()
        XCTAssertEqual([], result)
    }
    
    func test_intQueue가_비어있는지_확인하기() {
        // when
        let result = intQueue.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_stringQueue가_비어있는지_확인하기() {
        // when
        let result = stringQueue.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_doubleQueue가_비어있는지_확인하기() {
        // when
        let result = doubleQueue.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_String추가하기() {
        // given
        let word = "Hello"
        
        // when
        stringQueue.enqueue(word)
        
        // then
        XCTAssertNotNil(stringQueue.peek())
    }
    
    func test_String빼보기() {
        // given
        let word = "World"
        stringQueue.enqueue(word)
        
        // when
        let result = stringQueue.dequeue()
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_String큐청소하기() {
        // given
        let word = "Swift"
        stringQueue.enqueue(word)
        
        // when
        stringQueue.clear()
        
        // then
        let result = stringQueue.check()
        XCTAssertEqual([], result)
    }
    
    func test_Double추가하기() {
        // given
        let double = 0.7
        
        // when
        doubleQueue.enqueue(double)
        
        // then
        XCTAssertNotNil(doubleQueue.peek())
    }
    
    func test_Double빼보기() {
        // given
        let double = 0.5
        
        // when
        doubleQueue.enqueue(double)
        
        // then
        XCTAssertNotNil(doubleQueue.dequeue())
    }
    
    func test_Double큐청소하기() {
        // given
        let double = 0.315454
        doubleQueue.enqueue(double)
        
        // when
        doubleQueue.clear()
        
        // then
        let result = doubleQueue.check()
        XCTAssertEqual([], result)
    }
}
