//
//  QueueTest.swift
//  QueueTest
//
//  Created by Roh on 1/23/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class QueueTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_queue_enqueue() {
        var bankTellerQueue = BankTellerQueue<Int>()
        let result = 1
        bankTellerQueue.enqueue(item: result)
        XCTAssertEqual(bankTellerQueue.peek(), result)
    }
    
    func test_queue_dequeue() {
        var bankTellerQueue = BankTellerQueue<Int>()
        let result = 1
        bankTellerQueue.enqueue(item: result)
        let dequeueResult = bankTellerQueue.dequeue()
        XCTAssertEqual(dequeueResult, result)
    }
    
    func test_queue_clear() {
        var bankTellerQueue = BankTellerQueue<Int>()
        for n in 1...3 {
            bankTellerQueue.enqueue(item: n)
        }
        bankTellerQueue.clear()
        XCTAssertEqual(bankTellerQueue.peek(), nil)
    }
    
    func test_queue_peek() {
        var bankTellerQueue = BankTellerQueue<Int>()
        let result = 1
        bankTellerQueue.enqueue(item: result)
        XCTAssertEqual(bankTellerQueue.peek(), 1)
    }
    
    func test_queue_isEmpty() {
        let bankTellerQueue = BankTellerQueue<Int>()
        XCTAssertEqual(bankTellerQueue.isEmpty(), true)
    }
    
    func test_queue_10번손님찾기() {
        var bankTellerQueue = BankTellerQueue<Int>()
        var findNumber = 0
        var result: Int?
        for n in 1...15 {
            bankTellerQueue.enqueue(item: n)
        }
        while !(findNumber == 10) {
            findNumber += 1
            result = bankTellerQueue.dequeue()
        }
        XCTAssertEqual(10, result)
    }
    
    func test_queue_1번인큐_2번디큐() {
        var bankTellerQueue = BankTellerQueue<Int>()
        bankTellerQueue.enqueue(item: 1)
        var check = bankTellerQueue.dequeue()
        XCTAssertEqual(bankTellerQueue.dequeue(), nil)
    }
}
