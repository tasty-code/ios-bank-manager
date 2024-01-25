//
//  QueueTest.swift
//  QueueTest
//
//  Created by Roh on 1/23/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class QueueTest: XCTestCase {
    var sut: BankTellerQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BankTellerQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue호출시_1를_넣으면_1이_반환되는지() {
        //given
        let result = 1
        //when
        sut.enqueue(item: result)
        //then
        XCTAssertEqual(sut.peek(), result)
    }
    
    func test_dequeue호출시_1을_반환하는지() {
        //given
        let result = 1
        sut.enqueue(item: result)
        //when
        let dequeueResult = sut.dequeue()
        //then
        XCTAssertEqual(dequeueResult, result)
    }
    
    func test_dequeue호출시_빈배열일시_nil을반환하는지() {
        //given
        guard sut.isEmpty() else {
            XCTFail()
            return
        }
        //when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(result, nil)
    }
    
    func test_123삽입후_clear호출시_nil을_반환하는지() {
        //given
        for n in 1...3 {
            sut.enqueue(item: n)
        }
        //when
        sut.clear()
        //then
        XCTAssertEqual(sut.peek(), nil)
    }
    
    func test_4추가한List에서_clear호출시_isEmpty가true되는지() {
        //given
        sut.enqueue(item: 4)
        //when
        sut.clear()
        //then
        XCTAssertTrue(sut.isEmpty())
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_1삽입후_peek호출시_1을_반환하는지() {
        //given
        let result = 1
        //when
        sut.enqueue(item: result)
        //then
        XCTAssertEqual(sut.peek(), 1)
    }
    
    func test_생성시_isEmpty가_true인지_확인() {
        XCTAssertEqual(sut.isEmpty(), true)
    }
    
    func test_enqueue_15번실행후_dequeue를_이용해_10번손님찾을수있는지() {
        //given
        var findNumber = 0
        var result: Int?
        for n in 1...15 {
            sut.enqueue(item: n)
        }
        //when
        while !(findNumber == 10) {
            findNumber += 1
            result = sut.dequeue()
        }
        //then
        XCTAssertEqual(10, result)
    }
    
    func test_queue_1번실행후_2번queue_실행하여_nil값확인() {
        //when
        sut.enqueue(item: 1)
        var check = sut.dequeue()
        //then
        XCTAssertEqual(sut.dequeue(), nil)
    }
}
