//
//  BankManagerConsoleAppUnitTest.swift
//  BankManagerConsoleAppUnitTest
//
//  Created by 김수경 on 2023/10/30.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppUnitTest: XCTestCase {
    private var sut: Queue<Int> = Queue()
    
    func test_queue_isEmpty() {
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_queue_isEmpty_false() {
        sut.enqueue(data: 1)
        let result = sut.isEmpty
        XCTAssertEqual(result, false)
    }
    
    func test_peek_empty_return_nil() {
        let result = sut.peek
        XCTAssertNil(result)
    }
    
    func test_peek_return_1() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        XCTAssertEqual(1, sut.peek)
    }
    
    func test_dequeue연산후_peek을_검사() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.dequeue()
        guard let result = sut.peek else {
            return
        }
        XCTAssertEqual(result, 2)
    }
    
    func test_clear() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.clear()
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_clear_peek() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.clear()
        let result = sut.peek
        XCTAssertNil(result)
    }
    
    func test_clear_enqueue() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.clear()
        sut.enqueue(data: 3)
        let result = sut.peek
        XCTAssertEqual(result, 3)
    }
    
    func test_enqueue_dequeue() {
        let number = Int.random(in: 1...1000)
        sut.enqueue(data: number)
        XCTAssertEqual(number, sut.dequeue())
    }
}
