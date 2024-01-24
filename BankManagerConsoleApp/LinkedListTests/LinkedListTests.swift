//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by nayeon  on 2024/01/24.
//

import XCTest
@testable import BankManagerConsoleApp

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_빈리스트에append호출해서_2를추가하면_head값에2가할당되는지() {
        sut.append(item: 2)
        XCTAssertEqual(sut.head?.data, 2)
    }
    
    func test_5가있는리스트에서append호출시_7을추가하면_nexthead에7이할당되는지() {
        sut.append(item: 5)
        sut.append(item: 7)
        XCTAssertEqual(sut.head?.next?.data, 7)
    }

    func test_빈List에_removeFirst호출시_에러없이nil반환되는지() {
        guard sut.isEmpty else {
            XCTFail()
            return
        }
        let result = sut.removeFirst()

        XCTAssertNil(result)
    }
    
    func test_List에_3와9추가후_removeAll호출시_isEmpty가true되는지() {
        sut.append(item: 3)
        sut.append(item: 9)
        sut.removeAll()
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_1가있는List에_count요청하면_1반환() {
        sut.append(item: 1)
        let result = sut.count
        XCTAssertEqual(result, 1)
    }
    
    func test_List에4추가후_tail과head요청하면_4반환하는지() {
        sut.append(item: 4)
        let tail = sut.tail?.data
        let head = sut.head?.data
        XCTAssertEqual(tail, 4)
        XCTAssertEqual(head, 4)
    }
}
