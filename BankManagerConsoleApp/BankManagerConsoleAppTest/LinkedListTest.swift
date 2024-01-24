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
    
    func test_비어있을때_getFirst는_nil을_리턴한다() {
        // given
        setEmptySUT()
        
        // when
        let result = self.sut.getFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_요소가_두개있을때_getFirst는_front의_첫번째_요소를_리턴한다() {
        // given
        let (firstValue, secondValue) = ("first", "second")
        setSUTWithTwoElements(firstValue, secondValue)
        
        // when
        let result = self.sut.getFirst()
        
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
        
        let expectedHeadValue = secondValue
        XCTAssertEqual(headValue, expectedHeadValue)
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
        var lastNode = self.sut.head
        while let next = lastNode?.next {
            lastNode = next
        }
        let result = lastNode?.value
        let expected = newValue
        XCTAssertEqual(result, expected)
    }
}

extension LinkedListTest {
    private func setEmptySUT() {
        self.sut = LinkedList<String>()
    }
    
    private func setSUTWithOneElement(_ oneValue: String) {
        let node = Node(value: oneValue)
        self.sut = LinkedList(head: node)
    }
    
    private func setSUTWithTwoElements(_ firstValue: String, _ secondValue: String) {
        let secondNode = Node(value: secondValue)
        let firstNode = Node(value: firstValue, next: secondNode)
        self.sut = LinkedList(head: firstNode)
    }
}
