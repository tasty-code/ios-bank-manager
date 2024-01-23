//
//  BankManagerConsoleAppTest.swift
//  BankManagerConsoleAppTest
//
//  Created by yujaehong on 1/23/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleAppTest: XCTestCase {
    
    var queue = Queue<Int>()
    
    // MARK: - enqueue
    func queue에_enqueue호출_시_queue에_추가되는지() {
        queue.enqueue(1)
        let peek = queue.peek()
        let result = 1
        XCTAssertEqual(result, peek)
    }
    
    // MARK: - dequeue
    func queue에_dequeue호출_시_맨앞의_값이_반환되는지() {
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        let dequeueValue = queue.dequeue()
        XCTAssertEqual(dequeueValue, Optional(2))
    }
    
    // MARK: - peek
    
    
    // MARK: - isEmpty
    func queue가_비어있을때_isEmpty_호출_시_true를_반환하는지() {
        let result = queue.isEmpty()
        XCTAssertTrue(result)
    }
    
    
    
    
    

}
