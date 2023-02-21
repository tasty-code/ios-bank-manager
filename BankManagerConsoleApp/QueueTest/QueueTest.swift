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
    
    func test_3_4를_enqueue했을때_카운트가_2개인지() {
        //given
        let givenCountNumber = 2
        
        //when
        sut.euqueue(3)
        sut.euqueue(4)
        let actualCountNumber = sut.count
        
        //then
        XCTAssertEqual(actualCountNumber, givenCountNumber)
    }
    
    func test_비어있는Queue에_isEmpty했을때_True를_반환하는지() {
        //given
        
        //when
        
        //then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_3_4를_enque후_dequeue했을때_첫번째_노드가_삭제되는지() {
        //given
        let firstGivenNumber = 3
        let secondGivenNumber = 4
        sut.euqueue(firstGivenNumber)
        sut.euqueue(secondGivenNumber)
        
        //when
        let dequeuedData = sut.dequeue()
        
        //then
        XCTAssertEqual(firstGivenNumber, dequeuedData)
    }
}
