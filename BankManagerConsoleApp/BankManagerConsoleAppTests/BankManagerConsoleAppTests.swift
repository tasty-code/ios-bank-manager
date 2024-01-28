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
        // given
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_queue에_노드가_있다() {
        // given
        let input = "test"
        sut.enqueue(with: input)
        // when
        let result = sut.isEmpty
        // then
        XCTAssertFalse(result)
    }
    
    func test_queue에_노드가_다섯개_생성된다() {
        // given
        let data = [ "A", "B", "C", "D", "E" ]
        let expectedLengthOfQueue = 5
        for input in data {
            sut.enqueue(with: input)
        }
        // when
        let result = sut.totalLength()
        // then
        XCTAssertEqual(expectedLengthOfQueue, result)
    }
    
    func test_queue의_5번_enqueue_4번_dequeue_노드가_1개_남는다() {
        // given
        let data = [ "A", "B", "C", "D", "E" ]
        let lengthOfQueue = 1
        let countOfDeque = 4
        for input in data {
            sut.enqueue(with: input)
        }
        for i in 1...countOfDeque {
            let _ = sut.dequeue()
        }
        // when
        let result = sut.totalLength()
        // then
        XCTAssertEqual(lengthOfQueue, result)
    }
    
    func test_queue의_5번_enqueue_4번_dequeue_남은_노드를_peek_한다() {
        // given
        let data = [ "A", "B", "C", "D", "E" ]
        let lengthOfQueue = 2
        let countOfDeque = 3
        let peekCharacter = data[countOfDeque]
        for input in data {
            sut.enqueue(with: input)
        }
        for i in 1...countOfDeque {
            let _ = sut.dequeue()
        }
        // when
        let result = sut.peek()
        // then
        XCTAssertEqual(peekCharacter, result)
    }
    
    func test_초기에_dequeue를_했을때_카운트가_0이다() {
        // given
        let expectedCount = 0
        let _ = sut.dequeue()
        // when
        let result = sut.totalLength()
        // then
        XCTAssertEqual(expectedCount, result)
    }
    
    func test_dequeue_시_반환되는_노드가_Nil이다() {
        // given
        // when
        let result = sut.dequeue()
        // then 그렇다면 이 케이스는 통과하는가?
        XCTAssertNil(result)
    }
    
    ///⬇️ L 리팩토링 고고
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
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }

    func test_노드가_정상적으로_다음_노드를_연결한다() {
        sut.enqueue(with: "A")
        sut.enqueue(with: "B")
        sut.enqueue(with: "C")
        
        let result = sut.linkedList.head?.next?.next?.data
        XCTAssertEqual("C", result)
    }
    
    func test_tail의_다음_연결이_nil이다() {
        sut.enqueue(with: "A")
        sut.enqueue(with: "B")
        
        let result = sut.linkedList.tail?.next
        XCTAssertNil(result)
    }
}
