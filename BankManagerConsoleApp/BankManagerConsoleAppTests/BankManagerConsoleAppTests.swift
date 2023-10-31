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
        let num = 10
        intQueue.enqueue(num)
        guard let result = intQueue.peek() else { return }
        XCTAssertEqual(num, result)
    }
    
    func test_15빼보기() {
        let num = 15
        intQueue.enqueue(num)
        guard let result = intQueue.dequeue() else {return}
        XCTAssertEqual(result, 15)
    }
    
    func test_요소확인하기() {
        let array = [10, 20, 30]
        
        for item in array {
            intQueue.enqueue(item)
        }
        let result = intQueue.check()
        print(result)
        XCTAssertEqual(array, result)
    }
    
    func test_청소하기() {
        let num = 5
        intQueue.enqueue(num)
        intQueue.clear()
        let result = intQueue.check()
        XCTAssertEqual([], result)
    }
    
    func test_빈값확인하기() {
        XCTAssertEqual(true, intQueue.isEmpty)
    }
    
    func test_String추가하기() {
        let word = "Hello"
        stringQueue.enqueue(word)
        guard let result = stringQueue.peek() else { return }
        XCTAssertEqual(word, result)
    }
    
    func test_String빼보기() {
        let word = "World"
        stringQueue.enqueue(word)
        guard let result = stringQueue.dequeue() else {return}
        XCTAssertEqual(result, word)
    }
    
    func test_String큐청소하기() {
        let word = "Swift"
        stringQueue.enqueue(word)
        stringQueue.clear()
        let result = stringQueue.check()
        XCTAssertEqual([], result)
    }
    
    func test_Double추가하기() {
        let double = 0.7
        doubleQueue.enqueue(double)
        guard let result = doubleQueue.peek() else { return }
        XCTAssertEqual(double, result)
    }
    
    func test_Double빼보기() {
        let double = 0.5
        doubleQueue.enqueue(double)
        guard let result = doubleQueue.dequeue() else {return}
        XCTAssertEqual(result, double)
    }
    
    func test_Double큐청소하기() {
        let double = 0.315454
        doubleQueue.enqueue(double)
        doubleQueue.clear()
        let result = doubleQueue.check()
        XCTAssertEqual([], result)
    }
}
