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

    func test_큐에_10을_인큐했을_때_정상적으로_값이_들어간다() {
        // Given
        let enqueueNumber = 10
        
        // When
        sut.enqueue(enqueueNumber)
        
        // Then
        XCTAssertEqual(sut.peek(), 10)
    }
    
    func test_큐에_10을_인큐하고_디큐했을_때_정상적으로_값을_반환한다() {
        // Given
        let enqueueNumber = 10
        
        // When
        sut.enqueue(enqueueNumber)
        
        // Then
        XCTAssertEqual(sut.dequeue(), 10)
    }
    
    func test_큐에_여러값들을_인큐하고_클리어했을_때_큐가_비어있다() {
        // Given
        let enqueueNumbers = [10, 20, 15, 5]
        
        // When
        for enqueueNumber in enqueueNumbers {
            sut.enqueue(enqueueNumber)
        }
        sut.clear()
        
        // Then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_큐에_여러값들을_인큐하고_큐가_비어있는것이_거짓이다() {
        // Given
        let enqueueNumbers = [10, 20, 15, 5]
        
        // When
        for enqueueNumber in enqueueNumbers {
            sut.enqueue(enqueueNumber)
        }
        
        // Then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_큐에_인큐했을_떄_peek한_값이_정상적으로_나온다() {
        // Given
        let enqueueNumber = 10
        
        // When
        sut.enqueue(enqueueNumber)
        
        // Then
        XCTAssertEqual(sut.peek(), 10)
    }
}
