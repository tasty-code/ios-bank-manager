//
//  BankManagerConsoleAppTest.swift
//  BankManagerConsoleAppTest
//
//  Created by Effie on 1/23/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTest: XCTestCase {
    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        self.sut = Queue()
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    // 1. Peek
    func test_큐가_비어있을때_peek을_하면_nil을_리턴한다() {
        // given
        self.sut = Queue()
        
        // when
        let result = self.sut.peek()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_큐에_요소가_두개_일때_peek을_하면_리턴하는_것이_front의_첫번째_요소이다() {
        // given
        let (firstValue, secondeValue) = ("1", "2")
        let second = Node(value: secondeValue)
        let first = Node(value: firstValue, next: second)
        self.sut = Queue(linkedList: .init(head: first))
        
        // when
        let result = self.sut.peek()
        
        // then
        XCTAssertEqual(result, firstValue)
    }
    
    func test_큐가_비어있으면_isEmpty가_true이다() {
        // given
        self.sut = Queue()
        
        // when
        let result = self.sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_큐가_비어있지_않으면_isEmpty가_false이다() {
        let first = Node(value: "1")
        self.sut = Queue(linkedList: .init(head: first))
        
        // when
        let result = self.sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_비어있지_않으면_clear했을때_LinkedList의_head가_nil이다() {
        // given
        let first = Node(value: "1")
        self.sut = Queue(linkedList: .init(head: first))
        
        // when
        self.sut.clear()
        
        // then
        let result = self.sut.linkedList.head
        XCTAssertNil(result)
    }
    
    func test_큐가_비어있을때_dequeue하면_nil을_리턴한다() {
        // given
        self.sut = Queue()
        
        // when
        let result = self.sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_큐에_요소가_하나있을때_dequeue한_값은_nil_이_아니다() {
        // given
        let first = Node(value: "1")
        self.sut = Queue(linkedList: .init(head: first))
        
        // when
        let result = self.sut.dequeue()
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_큐에_요소가_두개있을때_dequeue한_값은_front의_첫번째_요소이다() {
        // given
        let (firstValue, secondeValue) = ("1", "2")
        let second = Node(value: secondeValue)
        let first = Node(value: firstValue, next: second)
        self.sut = Queue(linkedList: .init(head: first))
        
        // when
        let result = self.sut.dequeue()
        
        // then
        XCTAssertEqual(result, firstValue)
        XCTAssertNotEqual(result, secondeValue)
    }
    
    func test_큐에_요소가_하나있을때_요소를_추가하면_요소가_rear에_추가된다() {
        // given
        let firstNode = Node(value: "old")
        self.sut = Queue(linkedList: .init(head: firstNode))
        
        // when
        let newValue = "new"
        self.sut.enqueue(newValue)
        
        // then
        var lastNode = self.sut.linkedList.head
        while let nextNode = lastNode?.next {
            lastNode = nextNode
        }
        let result = lastNode?.value
        let expected = newValue
        XCTAssertEqual(result, expected)
    }
}
