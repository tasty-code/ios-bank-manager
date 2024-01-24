//
//  QueueTest.swift
//  BankManagerConsoleAppTest
//
//  Created by Effie on 1/23/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class QueueTest: XCTestCase {
    private var sut: Queue<String>!
    
    override func setUpWithError() throws {
        self.sut = Queue()
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    // MARK: - Peek
    
    func test_큐가_비어있을때_peek을_하면_nil을_리턴한다() {
        // given
        setEmptySUT()
        
        // when
        let result = self.sut.peek()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_큐에_요소가_두개_일때_peek을_하면_리턴하는_것이_front의_첫번째_요소이다() {
        // given
        let (firstValue, secondValue) = ("1", "2")
        setSUTWithTwoElements(firstValue, secondValue)
        
        // when
        let result = self.sut.peek()
        
        // then
        XCTAssertEqual(result, firstValue)
    }
    
    // MARK: - isEmpty
    
    func test_큐가_비어있으면_isEmpty가_true이다() {
        // given
        setEmptySUT()
        
        // when
        let result = self.sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_큐가_비어있지_않으면_isEmpty가_false이다() {
        setSUTWithOneElement("1")
        
        // when
        let result = self.sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    // MARK: - Clear
    
    func test_비어있지_않으면_clear했을때_LinkedList의_head가_nil이다() {
        // given
        setSUTWithOneElement("1")
        
        // when
        self.sut.clear()
        
        // then
        let result = self.sut.linkedList.head
        XCTAssertNil(result)
    }
    
    // MARK: - Dequeue
    
    func test_큐가_비어있을때_dequeue하면_nil을_리턴한다() {
        // given
        setEmptySUT()
        
        // when
        let result = self.sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_큐에_요소가_하나있을때_dequeue한_값은_nil_이_아니다() {
        // given
        setSUTWithOneElement("1")
        
        // when
        let result = self.sut.dequeue()
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_큐에_요소가_두개있을때_dequeue한_값은_front의_첫번째_요소이다() {
        // given
        let (firstValue, secondValue) = ("1", "2")
        setSUTWithTwoElements(firstValue, secondValue)
        
        // when
        let result = self.sut.dequeue()
        
        // then
        XCTAssertEqual(result, firstValue)
        XCTAssertNotEqual(result, secondValue)
    }
    
    // MARK: - Enqueue
    
    func test_큐에_요소가_하나있을때_요소를_enqueue하면_요소가_rear에_추가된다() {
        // given
        setSUTWithOneElement("old")
        
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

extension QueueTest {
    private func setEmptySUT() {
        self.sut = Queue()
    }
    
    private func setSUTWithOneElement(_ oneValue: String) {
        let first = Node(value: oneValue)
        self.sut = Queue(linkedList: .init(head: first))
    }
    
    private func setSUTWithTwoElements(_ firstValue: String, _ secondValue: String) {
        let second = Node(value: secondValue)
        let first = Node(value: firstValue, next: second)
        self.sut = Queue(linkedList: .init(head: first))
    }
}
