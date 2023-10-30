//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by Wonji Ha on 2023/10/30.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTests: XCTestCase {
    private var queue : Queue<Int>!
    
    override func setUpWithError() throws {
        self.queue = Queue<Int>()
    }
    
    override func tearDownWithError() throws {
        self.queue = nil
    }
    
    func test_10추가하기() {
        let num = 10
        queue.enqueue(num)
        guard let result = queue.peek() else { return }
        XCTAssertEqual(num, result)
    }
    
    func test_15빼보기() {
        let num = 15
        queue.enqueue(num)
        guard let result = queue.dequeue() else {return}
        XCTAssertEqual(result, 15)
    }
    
    func test_요소확인하기() {
        let array = [10, 20, 30]
        
        for item in array {
            queue.enqueue(item)
        }
        let result = queue.check()
        print(result)
        XCTAssertEqual(array, result)
    }
    
    func test_청소하기() {
        let num = 5
        queue.enqueue(num)
        queue.clear()
        let result = queue.check()
        XCTAssertEqual([], result)
    }
    
    func test_빈값확인하기() {
        XCTAssertEqual(true, queue.isEmpty)
    }
}
