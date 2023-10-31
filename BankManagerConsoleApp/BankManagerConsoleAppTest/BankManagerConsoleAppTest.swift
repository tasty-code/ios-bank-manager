//
//  BankManagerConsoleAppTest.swift
//  BankManagerConsoleAppTest
//
//  Created by 김경록 on 10/31/23.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppUnitTest: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK: - isEmpty Test
    func test_아무것도_추가되지_않았을_경우() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_데이터_한개_추가되었을_경우_False_반환() {
        let input = 123
        sut.enqueue(input)
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    // MARK: - enqueue Test
    func test_데이터값_하나만_추가되었을_경우() {
        let input = 123
        sut.enqueue(input)
        
        XCTAssertEqual(input, sut.peek())
    }
    
    func test_데이터값_두개_추가되었을_경우_연결성_확인() {
        let input = [123, 456, 789]
        input.forEach { sut.enqueue($0) }
        let _ = sut.dequeue()
        
        XCTAssertEqual(input[1], sut.peek())
    }
    
    // MARK: - dequeue Test
    func test_데이터값_제거() {
        let input = [123, 456, 789]
        input.forEach { sut.enqueue($0) }
        
        XCTAssertEqual(input[0], sut.dequeue())
    }
    
    func test_데이터값_제거_후_리스트_비었는지_확인() {
        let input = 1
        sut.enqueue(input)
        let _ = sut.dequeue()
        
        XCTAssertTrue(sut.isEmpty)
    }
    
    // MARK: - clear Test
    func test_clear_확인() {
        let input = [123, 456, 789]
        input.forEach { sut.enqueue($0) }
        sut.clear()
        
        XCTAssertTrue(sut.isEmpty)
    }
    
    // MARK: - Peek Test
    func test_peek_확인() {
        let input = [123, 456, 789]
        input.forEach{ sut.enqueue($0) }
        
        XCTAssertEqual(input[0], sut.peek())
    }
    
    // MARK: - Generic Test
    func test_generic_타입_작동_확인() {
        let stringQueue = Queue<String>()
        let intQueue = Queue<Int>()
        let doubleArrayQueue = Queue<Array<Double>>()
        
        let stringInput: [String] = ["Test1", "테스트2", "✅3"]
        let intInput: [Int] = [123, 456, 789]
        let doubleArrayInput: [[Double]] = [[1.2, 2.3, 3.4], [3.55, 5.77, 7.99], [-0.33, -7.77, -10.11]]
        
        stringInput.forEach { stringQueue.enqueue($0) }
        intInput.forEach { intQueue.enqueue($0) }
        doubleArrayInput.forEach { doubleArrayQueue.enqueue($0) }
        
        XCTAssertEqual(stringInput[0], stringQueue.peek())
        XCTAssertEqual(intInput[0], intQueue.peek())
        XCTAssertEqual(doubleArrayInput[0], doubleArrayQueue.peek())
    }
}
