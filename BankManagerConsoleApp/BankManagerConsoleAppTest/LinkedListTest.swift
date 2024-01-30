//
//  LinkedListTest.swift
//  BankManagerConsoleAppTest
//
//  Created by Effie on 1/23/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class LinkedListTest: XCTestCase {
    private var sut: LinkedList<String>!
    
    override func setUpWithError() throws {
        self.sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    // MARK: - isEmpty
    
    func test_linkedList가_비어있을때_isEmpty가_true이다() {
        // given
        setEmptySUT()
        
        // when
        let result = self.sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_linkedList가_비어있지_않을때_isEmpty가_false다() {
        // given
        setSUTWithOneElement("first")
        
        // when
        let result = self.sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    // MARK: - getFirst
    
    func test_비어있을때_first는_nil을_리턴한다() {
        // given
        setEmptySUT()
        
        // when
        let result = self.sut.first
        
        // then
        XCTAssertNil(result)
    }
    
    func test_요소가_두개있을때_first는_front의_첫번째_요소를_리턴한다() {
        // given
        let (firstValue, secondValue) = ("first", "second")
        setSUTWithTwoElements(firstValue, secondValue)
        
        // when
        let result = self.sut.first
        
        // then
        let expected = firstValue
        XCTAssertEqual(result, expected)
    }
    
    // MARK: - removeFirst
    
    func test_비어있을때_removeFirst하면_head가_nil이다() {
        // given
        setEmptySUT()
        
        // when
        self.sut.removeFirst()
        let result = self.sut.head
        
        // then
        XCTAssertNil(result)
    }
    
    func test_요소가_하나있을때_removeFirst하면_head가_nil이다() {
        // given
        setSUTWithOneElement("first")
        
        // when
        self.sut.removeFirst()
        let result = self.sut.head
        
        // then
        XCTAssertNil(result)
    }
    
    func test_요소가_두개있을때_removeFirst하면_front의_첫번째_요소를_리턴한다() {
        // given
        let (firstValue, secondValue) = ("first", "second")
        setSUTWithTwoElements(firstValue, secondValue)
        
        // when
        let result = self.sut.removeFirst()
        let headValue = self.sut.head?.value
        
        // then
        let expectedFirstValue = firstValue
        XCTAssertEqual(result, expectedFirstValue)
    }
    
    // MARK: - add
    
    func test_비어있을때_add를하면_head가_nil이_아니다() {
        // given
        setEmptySUT()
        
        // when
        self.sut.add(value: "new")
        let result = self.sut.head
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_요소가_하나있을때_add하면_rear에_추가된다() {
        // given
        setSUTWithOneElement("old")
        
        // when
        let newValue = "new"
        self.sut.add(value: newValue)
        
        // then
        let result = self.sut.tail?.value
        let expected = newValue
        XCTAssertEqual(result, expected)
    }
    
    // MARK: - Clear
    
    func test_비어있지_않으면_clear했을때_head와_tail이_nil이다() {
        // given
        setSUTWithOneElement("1")
        
        // when
        self.sut.clear()
        
        // then
        let head = self.sut.head
        let tail = self.sut.tail
        XCTAssertNil(head)
        XCTAssertNil(tail)
    }
    
    // MARK: - Count
    
    func test_비어있으면_count는_0이다() {
        // given
        setEmptySUT()
        
        // when
        let result = self.sut.count
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_한개일때_count는_1이다() {
        // given
        setSUTWithOneElement("1")
        
        // when
        let result = self.sut.count
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_1개일때_하나를_add하면_2개이다() {
        // given
        setSUTWithOneElement("old")
        
        // when
        self.sut.add(value: "new")
        let result = self.sut.count
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_1개일때_remove하면_0개이다() {
        // given
        setSUTWithOneElement("value")
        
        // when
        self.sut.removeFirst()
        let result = self.sut.count
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_0개일때_remove하면_0개이다() {
        // given
        setEmptySUT()
        
        // when
        self.sut.removeFirst()
        let result = self.sut.count
        
        // then
        XCTAssertEqual(result, 0)
    }
}

private extension LinkedListTest {
    func setEmptySUT() {
        self.sut = LinkedList<String>()
    }
    
    func setSUTWithOneElement(_ oneValue: String) {
        let node = Node(value: oneValue)
        self.sut = LinkedList(head: node)
    }
    
    func setSUTWithTwoElements(_ firstValue: String, _ secondValue: String) {
        let secondNode = Node(value: secondValue)
        let firstNode = Node(value: firstValue, next: secondNode)
        self.sut = LinkedList(head: firstNode)
    }
}
