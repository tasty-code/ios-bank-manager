//
//  QueueTest.swift
//  QueueTest
//
//  Created by Jason on 2023/02/21.
//

import XCTest
@testable import BankManagerConsoleApp

final class QueueTest: XCTestCase {
    
    var sut: Queue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_3_4를_enque했을때_카운트가_2개인지() {
        //given
        let givenCountNumber = 2
        
        //when
        sut.euqueue(3)
        sut.euqueue(4)
        let actualCountNumber = sut.count
        
        //then
        XCTAssertEqual(actualCountNumber, givenCountNumber)
    }
    
    func test_3을_enque했을때_Queue안에_Node가_존재하는지() {
        //given
        
        //when
        sut.euqueue(3)
        
        //then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_enque메서드_호출뒤_deque했을때_카운트가_0개인지() {
        //given
        let givenCountNumber = 0
        
        //when
        sut.euqueue(3)
        sut.euqueue(4)
        
        let _ = sut.dequeue()
        let _ = sut.dequeue()
        let actualCountNumber = sut.count
        //then
        XCTAssertEqual(actualCountNumber, givenCountNumber)
    }
}
