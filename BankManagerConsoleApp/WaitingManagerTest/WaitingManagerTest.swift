//
//  WaitingManagerTest.swift
//  WaitingManagerTest
//
//  Created by DONGWOOK SEO on 2023/02/22.
//

import XCTest
@testable import BankManagerConsoleApp

final class WaitingManagerTest: XCTestCase {
    
    var sut: WaitingManager<Int>!

    override func setUpWithError() throws {
        sut = WaitingManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_WaitingManager의_enqueue메서드가_Queue에_데이터를_저장하는지() {
        sut.enqueue(1)
        let result = sut.isEmpty()
        XCTAssertFalse(result)
    }
    
    func test_WaitingManager의_dequeue메서드가_Queue에_데이터를_제거하는지() {
        sut.enqueue(1)
        sut.dequeue()
        let result = sut.isEmpty()
        XCTAssertTrue(result)
    }
    
    func test_WaitingManager의_enqueue가_저장한_데이터들이_Queue에_잘_쌓이는지() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        
        let expectation: [Int] = [1,2,3,4]
        var result: [Int] = []
        while let data = sut.dequeue() {
            result.append(data)
        }
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_WaitingManager의_peek이_가장_앞의_데이터를_반환하는지() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        
        let result = sut.peek()
        let expectation = 1
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_WaitingManager의_peek이_데이터가_없을때_nil을_반환하는지() {
        let result = sut.peek()

        XCTAssertNil(result)
    }
    
}
