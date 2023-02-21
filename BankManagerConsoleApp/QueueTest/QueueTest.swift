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
}
