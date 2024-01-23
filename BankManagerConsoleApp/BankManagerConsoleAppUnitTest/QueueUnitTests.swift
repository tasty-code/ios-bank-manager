//
//  QueueUnitTests.swift
//  BankManagerConsoleAppUnitTest
//
//  Created by EUNJU on 2024/01/23.
//

import XCTest
@testable import BankManagerConsoleApp

class QueueUnitTests<T>: BaseTestCase {
    
    fileprivate var sut: Queue<T>!
    fileprivate var result: T!
    
    override func setUpWithError() throws {
        sut = Queue()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
}

final class IntegerQueueUnitTests: QueueUnitTests<Int> {
    
    // MARK: isEmpty
    func test_비어있는_큐의_isEmpty_프로퍼티값은_true() {
        given {
            sut = Queue()
        }
        
        then {
            XCTAssertTrue(sut.isEmpty)
        }
    }
    
    func test_비어있지않은_큐의_isEmpty_프로퍼티값은_false() {
        given {
            sut = Queue(queue: LinkedList(head: Node(1, Node(2))))
        }
        
        then {
            XCTAssertFalse(sut.isEmpty)
        }
    }
    
    // MARK: dequeue()
    func test_비어있는_큐에_삭제_연산을_하면_nil이나옴() {
        given {
            sut = Queue()
        }
        
        when {
            result = sut.dequeue()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지않은_큐에_삭제_연산을_하면_맨_앞_노드의_데이터인_1이나옴() {
        given {
            sut = Queue(queue: LinkedList(head: Node(1, Node(2))))
        }
        
        when {
            result = sut.dequeue()
        }
        
        then {
            XCTAssertEqual(result, 1)
        }
    }
    
    // MARK: enqueue()
    func test_비어있는_큐에_1을_삽입하고_삭제연산을_하면_1이나옴() {
        given {
            sut = Queue()
        }
        
        when {
            sut.enqueue(1)
        }
        
        then {
            XCTAssertEqual(sut.dequeue(), 1)
        }
    }
    
    func test_큐에_여러_데이터를_삽입하고_차례로_삭제연산을_하면_맨_앞_데이터부터_나옴() {
        given {
            sut = Queue()
        }
        
        when {
            sut.enqueue(1)
            sut.enqueue(2)
        }
        
        then {
            XCTAssertEqual(sut.dequeue(), 1)
            XCTAssertEqual(sut.dequeue(), 2)
        }
    }
    
    // MARK: peek()
    func test_비어있는_큐의_peek는_nil임() {
        given {
            sut = Queue()
        }
        
        when {
            result = sut.peek()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지않은_큐의_peek는_첫번째_노드의_데이터인_1임() {
        given {
            sut = Queue(queue: LinkedList(head: Node(1, Node(2))))
        }
        
        when {
            result = sut.peek()
        }
        
        then {
            XCTAssertEqual(result, 1)
        }
    }
    
    // MARK: clear()
    func test_비어있는_큐에_clear연산을_하면_peek가_nil() {
        given {
            sut = Queue()
        }
        
        when {
            sut.clear()
        }
        
        then {
            XCTAssertNil(sut.peek())
        }
    }
    
    func test_비어있지않은_큐에_clear연산을_하면_peek가_nil() {
        given {
            sut = Queue(queue: LinkedList(head: Node(1, Node(2))))
        }
        
        when {
            sut.clear()
        }
        
        then {
            XCTAssertNil(sut.peek())
        }
    }
}

final class StringQueueUnitTests: QueueUnitTests<String> {
    
    // MARK: isEmpty
    func test_비어있는_큐의_isEmpty_프로퍼티값은_true() {
        given {
            sut = Queue()
        }
        
        then {
            XCTAssertTrue(sut.isEmpty)
        }
    }
    
    func test_비어있지않은_큐의_isEmpty_프로퍼티값은_false() {
        given {
            sut = Queue(queue: LinkedList(head: Node("가", Node("나"))))
        }
        
        then {
            XCTAssertFalse(sut.isEmpty)
        }
    }
    
    // MARK: dequeue()
    func test_비어있는_큐에_삭제_연산을_하면_nil이나옴() {
        given {
            sut = Queue()
        }
        
        when {
            result = sut.dequeue()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지않은_큐에_삭제_연산을_하면_맨_앞_노드의_데이터인_가가나옴() {
        given {
            sut = Queue(queue: LinkedList(head: Node("가", Node("나"))))
        }
        
        when {
            result = sut.dequeue()
        }
        
        then {
            XCTAssertEqual(result, "가")
        }
    }
    
    // MARK: enqueue()
    func test_비어있는_큐에_가를_삽입하고_삭제연산을_하면_가가나옴() {
        given {
            sut = Queue()
        }
        
        when {
            sut.enqueue("가")
        }
        
        then {
            XCTAssertEqual(sut.dequeue(), "가")
        }
    }
    
    func test_큐에_여러_데이터를_삽입하고_차례로_삭제연산을_하면_맨_앞_데이터부터_나옴() {
        given {
            sut = Queue()
        }
        
        when {
            sut.enqueue("가")
            sut.enqueue("나")
        }
        
        then {
            XCTAssertEqual(sut.dequeue(), "가")
            XCTAssertEqual(sut.dequeue(), "나")
        }
    }
    
    // MARK: peek()
    func test_비어있는_큐의_peek는_nil임() {
        given {
            sut = Queue.init()
        }
        
        when {
            result = sut.peek()
        }
        
        then {
            XCTAssertNil(result)
        }
    }
    
    func test_비어있지않은_큐의_peek는_첫번째_노드의_데이터인_가임() {
        given {
            sut = Queue(queue: LinkedList(head: Node("가", Node("나"))))
        }
        
        when {
            result = sut.peek()
        }
        
        then {
            XCTAssertEqual(result, "가")
        }
    }
    
    // MARK: clear()
    func test_비어있는_큐에_clear연산을_하면_peek가_nil() {
        given {
            sut = Queue.init()
        }
        
        when {
            sut.clear()
        }
        
        then {
            XCTAssertNil(sut.peek())
        }
    }
    
    func test_비어있지않은_큐에_clear연산을_하면_peek가_nil() {
        given {
            sut = Queue(queue: LinkedList(head: Node("가", Node("나"))))
        }
        
        when {
            sut.clear()
        }
        
        then {
            XCTAssertNil(sut.peek())
        }
    }
}
