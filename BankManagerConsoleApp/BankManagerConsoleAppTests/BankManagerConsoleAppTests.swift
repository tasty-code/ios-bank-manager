//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by 동준 on 10/31/23.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTests: XCTestCase {
    var queue = Queue<Int>()
    
    func test_Queue가_비어있을때_isEmpty호출시_true를_반환하는지() {
        let result = queue.isEmpty
        
        XCTAssertEqual(result, true)
    }
    
    //MARK: - enqueue
    func test_Queue에_enqueue호출_시_queue에_추가되는지() {
        queue.enqueue(3)
        
        let peek = queue.peek
        let result = 3
        
        XCTAssertEqual(result, peek)
    }
    
    func test_Queue에_여러번_enqueue시에_값이_모두_들어가는지() {
        for i in 1..<10 {
            queue.enqueue(i)
        }
        
        let array = queue.fetchQueue()
        
        let result = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        XCTAssertEqual(result, array)
    }
    
    //MARK: - dequeue
    func test_Queue에_dequeue호출_시_맨앞에_값이_반환되는지() {
        queue.enqueue(4)
        queue.enqueue(9)
        queue.enqueue(23)
        
        let dequeueValue = queue.dequeue()
        
        XCTAssertEqual(dequeueValue, 4)
    }
    
    func test_Queue가_비어있을_때_dequeue호출시_nil이_반환되는지() {
        
        let result = queue.dequeue()
        
        XCTAssertNil(result)
    }
    
    func test_Queue에_dequeue호출_시_맨앞에값이_삭제되는지() {
        queue.enqueue(4)
        queue.enqueue(9)
        queue.enqueue(23)
        
        let _ = queue.dequeue()
        let array = queue.fetchQueue()
        
        let result = [9,23]
        
        XCTAssertEqual(result, array)
    }
    
    func test_Queue_dequeue호출시에_head가_다음노드를_가리키는지() {
        queue.enqueue(2)
        queue.enqueue(4)
        
        let _ = queue.dequeue()
        
        let result = queue.peek
        
        XCTAssertEqual(result, 4)
    }
    
    func test_Queue의_enqueue횟수와_dequeue의_횟수가_동일하게_호출_될_시_head가_nil인지() {
        for i in 0..<10 {
            queue.enqueue(i)
        }
        
        for _ in 0..<10 {
            let _ = queue.dequeue()
        }
        
        let result = queue.peek
        
        XCTAssertNil(result)
    }
    
    //MARK: - peek
    func test_Queue가_비어있을_때_peek호출_시_nil을_반환하는지() {
        
        let result = queue.peek
        
        if queue.isEmpty {
            XCTAssertNil(result)
        }
    }
    
    func test_Queue에_peek호출_시에_첫번째노드의_값을_반환하는지() {
        queue.enqueue(4)
        queue.enqueue(9)
        queue.enqueue(23)
        
        let result = queue.peek
        
        XCTAssertEqual(result, 4)
    }
    
    //MARK: - clear
    func test_Queue_clear호출_시_queue가_비어있는지() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        queue.clear()
        
        let result = queue.isEmpty
        
        XCTAssertTrue(result)
    }
}
