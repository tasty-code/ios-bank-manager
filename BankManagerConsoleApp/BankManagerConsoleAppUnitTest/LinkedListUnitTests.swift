//
//  LinkedListUnitTests.swift
//  BankManagerConsoleApp
//
//  Created by EUNJU on 2024/01/22.
//

import XCTest
@testable import BankManagerConsoleApp

class LinkedListUnitTests<T>: BaseTestCase {
    
    fileprivate var sut: LinkedList<T>!
    fileprivate var result: T!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
}

// MARK: - LinkedList Integer타입 유닛테스트
final class IntegerLinkedListUnitTests: LinkedListUnitTests<Int> {
    
    // MARK: isEmpty property
    func test_링크드리스트가_비어있으면_isEmpty는_true() {
        given {
            sut = LinkedList()
        }
        
        then {
            XCTAssertTrue(sut.isEmpty)
        }
    }
    
    func test_링크드리스트가_비어있지_않으면_isEmpty는_false() {
        given {
            sut = LinkedList(head: Node(1))
        }
        
        then {
            XCTAssertFalse(sut.isEmpty)
        }
    }
        
    // MARK: first property
    func test_비어있는_링크드리스트의_첫번째_노드를_가져오면_nil이_나옴() {
        given {
            sut = LinkedList()
        }
        
        then {
            XCTAssertNil(sut.first)
        }
    }
    
    func test_링크드리스트에_1_삽입_후_첫번째_헤드의_데이터를_가져오면_1이_나옴() {
        given {
            sut = LinkedList(head: Node(1))
        }
        
        then {
            XCTAssertEqual(sut.first, 1)
        }
    }

    // MARK: append()
    func test_비어있는_링크드리스트에_노드를_추가하면_first가_nil이_아님() {
        given {
            sut = LinkedList()
        }
        
        when {
            sut.append(1)
        }
        
        then {
            XCTAssertNotNil(sut.first)
        }
    }
    
    func test_노드를_추가하면_헤드로_마지막_노드_데이터인_2가_나옴() {
        given {
            sut = LinkedList()
        }
        
        when {
            sut.append(1)
            sut.append(2)
        }
        
        then {
            while (sut.head?.next != nil) {
                sut.head = sut.head?.next
            }
            XCTAssertEqual(sut.head?.data, 2)
        }
    }
    
    
    // MARK: removeFirst()
    func test_비어있는_링크드리스트_삭제하면_nil값을_리턴함() {
        given {
            sut = LinkedList()
        }
        
        when {
            result = sut.removeFirst()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지_않은_링크드리스트의_요소를_삭제하면_삭제된_요소를_리턴함() {
        given {
            sut = LinkedList(head: Node(1))
        }
        
        when {
            result = sut.removeFirst()
        }
        
        then {
            XCTAssertEqual(result, 1)
        }
    }
    
    // MARK: removeAll()
    func test_링크드리스트의_요소를_전체삭제하면_헤드가_nil() {
        given {
            sut = LinkedList(head: Node(1, Node(2)))
        }
        
        when {
            sut.removeAll()
        }
        
        then {
            XCTAssertNil(sut.head)
        }
    }
}

// MARK: - LinkedList String타입 유닛테스트
final class StringLinkedListUnitTests: LinkedListUnitTests<String> {
    
    // MARK: isEmpty property
    func test_링크드리스트가_비어있으면_isEmpty는_true() {
        given {
            sut = LinkedList()
        }
        
        then {
            XCTAssertTrue(sut.isEmpty)
        }
    }
    
    func test_링크드리스트가_비어있지_않으면_isEmpty는_false() {
        given {
            sut = LinkedList(head: Node("가"))
        }
        
        then {
            XCTAssertFalse(sut.isEmpty)
        }
    }
        
    // MARK: first property
    func test_비어있는_링크드리스트의_첫번째_노드를_가져오면_nil이_나옴() {
        given {
            sut = LinkedList()
        }
        
        then {
            XCTAssertNil(sut.first)
        }
    }
    
    func test_비어있지_않는_링크드리스트의_첫번째_헤드의_데이터를_가져오면_가가_나옴() {
        given {
            sut = LinkedList(head: Node("가"))
        }
        
        then {
            XCTAssertEqual(sut.first, "가")
        }
    }

    // MARK: append()
    func test_비어있는_링크드리스트에_노드를_추가하면_first가_nil이_아님() {
        given {
            sut = LinkedList()
        }
        
        when {
            sut.append("가")
        }
        
        then {
            XCTAssertNotNil(sut.first)
        }
    }
    
    func test_노드를_추가하면_헤드로_마지막_노드_데이터인_나가_나옴() {
        given {
            sut = LinkedList()
        }
        
        when {
            sut.append("가")
            sut.append("나")
        }
        
        then {
            while (sut.head?.next != nil) {
                sut.head = sut.head?.next
            }
            XCTAssertEqual(sut.head?.data, "나")
        }
    }
    
    
    // MARK: removeFirst()
    func test_비어있는_링크드리스트_삭제하면_nil값을_리턴함() {
        given {
            sut = LinkedList()
        }
        
        when {
            result = sut.removeFirst()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지_않은_링크드리스트의_요소를_삭제하면_삭제된_요소를_리턴함() {
        given {
            sut = LinkedList(head: Node("가"))
        }
        
        when {
            result = sut.removeFirst()
        }
        
        then {
            XCTAssertEqual(result, "가")
        }
    }
    
    // MARK: removeAll()
    func test_링크드리스트의_요소를_전체삭제하면_헤드가_nil() {
        given {
            sut = LinkedList(head: Node("가", Node("나")))
        }
        
        when {
            sut.removeAll()
        }
        
        then {
            XCTAssertNil(sut.head)
        }
    }
}
