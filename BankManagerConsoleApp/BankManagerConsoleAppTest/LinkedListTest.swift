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
    
    func test_linkedList가_비어있을때_isEmpty가_true이다() {
        // given
        self.sut = LinkedList<String>()
        
        // when
        let result = self.sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_linkedList가_비어있지_않을때_isEmpty가_false다() {
        // given
        let node = Node(value: "first")
        self.sut = LinkedList(head: node)
        
        // when
        let result = self.sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_비어있을때_getFirst는_nil을_리턴한다() {
        // given
        self.sut = LinkedList<String>()
        
        // when
        let result = self.sut.getFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_요소가_두개있을때_getFirst는_front의_첫번째_요소를_리턴한다() {
        // given
        let (firstValue, secondValue) = ("first", "second")
        let secondNode = Node(value: secondValue)
        let firstNode = Node(value: firstValue, next: secondNode)
        self.sut = LinkedList(head: firstNode)
        
        // when
        let result = self.sut.getFirst()
        
        // then
        let expected = firstValue
        XCTAssertEqual(result, expected)
    }
    
    #warning("이게 맞나")
    func test_비어있을때_removeFirst하면_head가_nil이다() {
        // given
        self.sut = LinkedList<String>()
        
        // when
        self.sut.removeFirst()
        let result = self.sut.head
        
        // then
        XCTAssertNil(result)
    }
    
    func test_요소가_하나있을때_removeFirst하면_head가_nil이다() {
        // given
        let node = Node(value: "first")
        self.sut = LinkedList(head: node)
        
        // when
        self.sut.removeFirst()
        let result = self.sut.head
        
        // then
        XCTAssertNil(result)
    }
    
    func test_요소가_두개있을때_removeFirst하면_front의_첫번째_요소를_리턴한다() {
        // given
        let (firstValue, secondValue) = ("first", "second")
        let secondNode = Node(value: secondValue)
        let firstNode = Node(value: firstValue, next: secondNode)
        self.sut = LinkedList(head: firstNode)
        
        // when
        let result = self.sut.removeFirst()
        let headValue = self.sut.head?.value
        
        // then
        let expectedFirstValue = firstValue
        XCTAssertEqual(result, expectedFirstValue)
        
        let expectedHeadValue = secondValue
        XCTAssertEqual(headValue, expectedHeadValue)
    }
    
    func test_비어있을때_add를하면_head가_nil이_아니다() {
        // given
        self.sut = LinkedList<String>()
        
        // when
        self.sut.add(value: "new")
        let result = self.sut.head
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_요소가_하나있을때_add하면_rear에_추가된다() {
        // given
        let node = Node(value: "old")
        self.sut = LinkedList(head: node)
        
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
