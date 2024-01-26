//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by LeeSeongYeon on 2024/01/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTests: XCTestCase {
    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        sut = Queue<String>()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_queue에_노드가_없다() {
        let result = sut.isEmpty()
        XCTAssertTrue(result)
    }
    
    func test_queue에_노드가_있다() {
        sut.enqueue(with: "test")
        let result = sut.isEmpty()
        XCTAssertFalse(result)
    }
    
    func test_queue에_노드가_다섯개_생성된다() {
        sut.enqueue(with: "A")
        sut.enqueue(with: "B")
        sut.enqueue(with: "C")
        sut.enqueue(with: "D")
        sut.enqueue(with: "E")
        
        XCTAssertEqual(5, sut.totalLength())
    }
    
    func test_queue의_5번_enqueue_4번_dequeue_노드가_1개_남는다() {
        sut.enqueue(with: "A")
        sut.enqueue(with: "B")
        sut.enqueue(with: "C")
        sut.enqueue(with: "D")
        sut.enqueue(with: "E")
        sut.dequeue()
        sut.dequeue()
        sut.dequeue()
        sut.dequeue()
        
        XCTAssertEqual(1, sut.totalLength())
    }
    
    func test_queue의_5번_enqueue_4번_dequeue_남은_노드를_peek_한다() {
        sut.enqueue(with: "A")
        sut.enqueue(with: "B")
        sut.enqueue(with: "C")
        sut.enqueue(with: "D")
        sut.enqueue(with: "E")
        sut.dequeue()
        sut.dequeue()
        sut.dequeue()
        sut.dequeue()
        
        let result = sut.peek()
        
        XCTAssertEqual("E", result)
    }
    
    func test_초기에_dequeue를_했을때_카운트가_0이다() {
        sut.dequeue()
        let result = sut.totalLength()
        XCTAssertEqual(0, result)
    }
    
    func test_dequeue_시_반환되는_노드가_0이다() {
        let result = sut.dequeue()
        XCTAssertNil(result)
    }
    
    func test_dequeue한_데이터가_삭제된다() {
        let firstInput = "First"
        let secondInput = "Second"
        
        sut.enqueue(with: firstInput)
        sut.enqueue(with: secondInput)
        
        sut.dequeue()
        let result = sut.peek()
        
        XCTAssertEqual(secondInput, result)
    }
    
    func test_dequeue시_삭제되는_첫데이터_확인() {
        let firstInput = "First"
        let secondInput = "Second"
        
        sut.enqueue(with: firstInput)
        sut.enqueue(with: secondInput)
        
        let result = sut.dequeue()
        
        XCTAssertEqual(firstInput, result)
    }
    
    func test_첫노드를_peek한다() {
        let firstInput = "First"
        let secondInput = "Second"
        
        sut.enqueue(with: firstInput)
        sut.enqueue(with: secondInput)
        
        let result = sut.peek()
        
        XCTAssertEqual(firstInput, result)
    }
    
    func test_큐를_clear한다() {
        let _ = sut.enqueue(with: "A")
        let _ = sut.enqueue(with: "B")
        let _ = sut.enqueue(with: "C")
        let _ = sut.enqueue(with: "D")
        let _ = sut.clean()
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }

//  Private 테스트 확인 필요
//    func test_노드가_정상적으로_다음_노드를_연결한다() {
//        sut.enqueue(with: "A")
//        sut.enqueue(with: "B")
//        
//        let result = sut.queue.head?.next?.data
//        XCTAssertEqual("B", result)
//    }
//    
//    func test_tail의_다음_연결이_nil이다() {
//        sut.enqueue(with: "A")
//        sut.enqueue(with: "B")
//        
//        let result = sut.queue.tail?.next
//        XCTAssertNil(result)
//    }
//    
}
