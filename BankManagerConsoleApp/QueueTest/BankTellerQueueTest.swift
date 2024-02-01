//
//  QueueTest.swift
//  QueueTest
//
//  Created by Roh on 1/23/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankTellerQueueTest: XCTestCase {
    var bankTellerQueue: Queue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        bankTellerQueue = Queue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        bankTellerQueue = nil
    }
    
    func test_queue에_enqueue호출후_1을_넣고_peek호출시_1을_반환하는지() {
        //given
        let result = 1
        bankTellerQueue.enqueue(item: result)
        //when
        let peekResult = bankTellerQueue.peek()
        //then
        XCTAssertEqual(peekResult, result)
    }
    
    func test_queue에_enqueue호출후_1를_추가하면_dequeue호출시_1을_반환하는지() {
        //given
        let result = 1
        bankTellerQueue.enqueue(item: result)
        //when
        let dequeueResult = bankTellerQueue.dequeue()
        //then
        XCTAssertEqual(dequeueResult, result)
        XCTAssertEqual(bankTellerQueue.dequeue(), nil)
    }
    
    func test_queue가_비어있고_dequeue호출시_nil을반환하는지() {
        //given
        //when
        guard bankTellerQueue.isEmpty() else {
            XCTFail()
            return
        }
        let dequeueResult = bankTellerQueue.dequeue()
        //then
        XCTAssertEqual(dequeueResult, nil)
    }
    
    func test_queue에_enqueue호출후_123을_넣고_clear후_peek을_호출시_nil을_반환하는지() {
        //given
        for value in 1...3 {
            bankTellerQueue.enqueue(item: value)
        }
        //when
        bankTellerQueue.clear()
        let peekResult = bankTellerQueue.peek()
        //then
        XCTAssertEqual(peekResult, nil)
    }
    
    func test_queue에_enqueue호출후_4를_넣고_clear호출시_isEmpty가true_count가_0을_반환하는지() {
        //given
        bankTellerQueue.enqueue(item: 4)
        //when
        bankTellerQueue.clear()
        let isEmptyResult = bankTellerQueue.isEmpty()
        let countResult = bankTellerQueue.count
        //then
        XCTAssertTrue(isEmptyResult)
        XCTAssertEqual(countResult, 0)
    }
    
    func test_queue에_enqueue호출후_4를_넣고_isEmpty가false_count가_1을_반환하는지() {
        //given
        bankTellerQueue.enqueue(item: 4)
        //when
        let isEmptyResult = bankTellerQueue.isEmpty()
        let countResult = bankTellerQueue.count
        //then
        XCTAssertTrue(isEmptyResult)
        XCTAssertEqual(countResult, 0)
    }
    
    func test_queue에_isEmpty호출시_true를_반환하는지() {
        //given
        let result = true
        //when
        let isEmptyResult = bankTellerQueue.isEmpty()
        //then
        XCTAssertEqual(isEmptyResult, result)
    }
    
    func test_queue에_enqueue호출후_1을_넣고_isEmpty호출시_false를_반환하는지() {
        //given
        let result = true
        //when
        bankTellerQueue.enqueue(item: 1)
        let isEmptyResult = bankTellerQueue.isEmpty()
        //then
        XCTAssertEqual(isEmptyResult, result)
    }
    
    func test_queue에_enqueue호출후_1부터15를넣고_10이_될때까지_dequeue시_10을_반환하는지() {
        //given
        var findNumber = 0
        let result = 10
        var dequeueResult: Int?
        for value in 1...15 {
            bankTellerQueue.enqueue(item: value)
        }
        //when
        while !(findNumber == 10) {
            findNumber += 1
            dequeueResult = bankTellerQueue.dequeue()
        }
        //then
        XCTAssertEqual(dequeueResult, result)
    }
    
    func test_queue애_enqueue_1을넣고_2번_dequeue시_nil을_반환하는지() {
        //given
        var dequeueResult: Int?
        bankTellerQueue.enqueue(item: 1)
        //when
        for _ in 1...2 {
            dequeueResult = bankTellerQueue.dequeue()
        }
        //then
        XCTAssertEqual(dequeueResult, nil)
    }
}
