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
    func test_아무것도_추가되지_않았을_경우_isEmpty의_결과값이_True() {
        //given
        
        //when
        let isEmpty = sut.isEmpty
        
        //then
        XCTAssertTrue(isEmpty)
    }
    
    func test_데이터값_추가시_정상추가되면_isEmpty의_결과값이_False() {
        // given
        let input = 123
        
        // when
        sut.enqueue(input)
        
        // then
        XCTAssertFalse(sut.isEmpty)
    }
    
    // MARK: - enqueue Test
    func test_데이터값_하나만_추가되었을_경우_peek하면_input과_같음() {
        // given
        let input = 123
        
        // when
        sut.enqueue(input)
        
        // then
        XCTAssertEqual(input, sut.peek())
    }
    
    func test_데이터값_두개이상_추가되었을_경우_Peek와_input의_마지막값과_같음() {
        // given
        let input = [123, 456, 789]
        
        // when
        input.forEach { sut.enqueue($0) }
        
        let _ = sut.dequeue()
        
        // then
        XCTAssertEqual(input[1], sut.peek())
    }
    
    // MARK: - dequeue Test
    func test_데이터값_두개이상_추가되었을_경우_dequeue가_FIFO로_작동함() {
        // given
        let input = [123, 456, 789]
        
        // when
        input.forEach { sut.enqueue($0) }
        
        // then
        XCTAssertEqual(input[0], sut.dequeue())
        XCTAssertNotEqual(input[0], sut.peek())
    }
    
    func test_데이터값_제거_후_리스트가_isEmpty시_True() {
        // given
        let input = 1
        
        // when
        sut.enqueue(input)
        let _ = sut.dequeue()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    // MARK: - clear Test
    func test_clear시_리스트가_isEmpty시_True() {
        // given
        let input = [123, 456, 789]
        
        // when
        input.forEach { sut.enqueue($0) }
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    // MARK: - Peek Test
    func test_peek시_input의_0번째_인덱스와_같음() {
        // given
        let input = [123, 456, 789]
        
        // when
        input.forEach{ sut.enqueue($0) }
        
        // then
        XCTAssertEqual(input[0], sut.peek())
    }
    
    // MARK: - Generic Test
    func test_generic에_String타입_적용시_Input과_peek이_같음() {
        // given
        let stringQueue = Queue<String>()
        let stringInput: [String] = ["Test1", "테스트2", "✅3"]
        
        // when
        stringInput.forEach { stringQueue.enqueue($0) }
        
        // then
        XCTAssertEqual(stringInput[0], stringQueue.peek())
    }
    
    func test_generic에_Int타입_적용시_Input과_peek이_같음() {
        //given
        let intQueue = Queue<Int>()
        let intInput: [Int] = [123, 456, 789]
        
        // when
        intInput.forEach { intQueue.enqueue($0) }

        //then
        XCTAssertEqual(intInput[0], intQueue.peek())
    }
    
    func test_generic에_Double타입_적용시_Input과_peek이_같음() {
        //given
        let doubleArrayQueue = Queue<Array<Double>>()
        let doubleArrayInput: [[Double]] = [[1.2, 2.3, 3.4], [3.55, 5.77, 7.99], [-0.33, -7.77, -10.11]]
        
        //when
        doubleArrayInput.forEach { doubleArrayQueue.enqueue($0) }
        
        //then
        XCTAssertEqual(doubleArrayInput[0], doubleArrayQueue.peek())
    }
}
