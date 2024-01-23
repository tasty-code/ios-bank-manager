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
    
    func test_노드가_없을때_dequeue하면_남은_노드의_개수는_0이다() throws {
        // given
        
        // when
        self.sut.dequeue()
        
        // then
        XCTAssertEqual(self.sut.linkedList.count, 0)
    }
    
    func test_node가_하나일때_dequeue를_하면_some을_리턴한다() throws {
        // given
        self.sut = Queue(linkedList: .init(head: .init(value: "Effie")))
        
        // when
        let result = self.sut.dequeue()
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_node가_하나일때_dequeue를_하면_isEmpty가_true다() throws {
        // given
        self.sut = Queue(linkedList: .init(head: .init(value: "Effie")))
        
        // when
        self.sut.dequeue()
        let result = self.sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_node가_없을때_enqueue하면_isEmpty가_false이다() throws {
        // given
        self.sut = Queue()
        
        // when
        self.sut.enqueue("Effie")
        let result = self.sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    //    func test_node가_있을때_clear하면
    
    func test_node가_없을때_peek하면_nil을_리턴한다() throws {
        // given
        self.sut = Queue()
        
        // when
        let result = self.sut.peek()
        
        // then
        XCTAssertNil(result)
    }
}
