//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by J.E on 2023/02/21.
//

import XCTest

final class BankManagerConsoleAppTests: XCTestCase {
    private var sut: Queue<Int>!

    override func setUpWithError() throws {
        sut = Queue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Node1과Node2를_enqueue하면_head가Node1이고_tail이Node2다() {
        let (firstGivenValue, secondGivenValue) = (Node(1), Node(2))
        let (firstExpectedValue, secondExpectedValue) = (1, 2)
        
        sut.enqueue(firstGivenValue)
        sut.enqueue(secondGivenValue)
        
        guard let head = sut.peekFirst()?.data,
              let tail = sut.peekLast()?.data else { return }
        
        XCTAssertEqual([head, tail], [firstExpectedValue, secondExpectedValue])
    }
    
    func test_queue를_clear하면_isEmpty함수가_true를반환한다() {
        let (firstGivenValue, secondGivenValue) = (Node(1), Node(2))
        sut.enqueue(firstGivenValue)
        sut.enqueue(secondGivenValue)
        
        sut.clear()
        let givenValue = sut.isEmpty()
        
        XCTAssertTrue(givenValue)
    }
}
