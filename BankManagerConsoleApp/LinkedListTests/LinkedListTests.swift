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
    
    func test_빈List에append호출시_2를추가하면_head값에2가할당되는지() {
        //when
        sut.append(item: 2)
        //then
        XCTAssertEqual(sut.head?.data, 2)
    }
    
    func test_5가있는List에append호출시_7을추가하면_nexthead에7이할당되는지() {
        //given
        sut.append(item: 5)
        //when
        sut.append(item: 7)
        //then
        XCTAssertEqual(sut.head?.next?.data, 7)
    }

    func test_빈List에_removeFirst호출시_에러없이nil반환되는지() {
        //given
        guard sut.isEmpty else {
            XCTFail()
            return
        }
        //when
        let result = sut.removeFirst()
        //then
        XCTAssertNil(result)
    }
    
    func test_List에_3와9추가후_removeAll호출시_isEmpty가true되는지() {
        //given
        sut.append(item: 3)
        sut.append(item: 9)
        //when
        sut.removeAll()
        //then
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_1가있는List에_count요청시_1반환하는지() {
        //given
        sut.append(item: 1)
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_List에4추가후_tail과head요청시_4반환하는지() {
        //given
        sut.append(item: 4)
        //when
        let tail = sut.tail?.data
        let head = sut.head?.data
        //then
        XCTAssertEqual(tail, 4)
        XCTAssertEqual(head, 4)
    }
}
