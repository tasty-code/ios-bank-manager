//
//  QueueUnitTest.swift
//  QueueUnitTest
//
//  Created by 문성진 on 2022/10/12.
//

import XCTest

@testable import BankManagerConsoleApp

final class QueueUnitTest: XCTestCase {

    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = Queue<Int>()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }

    func TestEnqueue() {
        sut.enqueue(10)
        
        let result = sut.peek()
        
        XCTAssertEqual(result, 10)
    }
    
    func TestDequeue() {
        
    }
    
    func TestClesr() {
        
    }
    
    func TestIsEmpty() {
        
    }
    
    func TestPeek() {
       
    }

}
