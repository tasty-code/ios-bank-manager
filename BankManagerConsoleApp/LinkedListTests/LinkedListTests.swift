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
        sut.append(new: 2)
        //then
        XCTAssertEqual(sut.head?.data, 2)
    }
    
    func test_5가있는List에append호출시_7을추가하면_nexthead에7이할당되는지() {
        //given
        sut.append(new: 5)
        //when
        sut.append(new: 7)
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
        sut.append(new: 3)
        sut.append(new: 9)
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
        sut.append(new: 1)
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_List에4추가후_tail과head요청시_4반환하는지() {
        //given
        sut.append(new: 4)
        //when
        let tail = sut.tail?.data
        let head = sut.head?.data
        //then
        XCTAssertEqual(tail, 4)
        XCTAssertEqual(head, 4)
    }
    
    func test_LinkedList_중간에_2번째에_7을삽입하고_첫번째노드를_삭제했을때_head가_7이되는지확인() {
        //given
        sut.append(new: 1)
        sut.append(new: 2)
        sut.append(new: 3)
        sut.append(new: 4)
        
        //when
        sut.insert(value: 7, index: 1)
        let _ = sut.removeFirst()
        let head = sut.head?.data
        //then
        XCTAssertEqual(head, 7)
    }
    
    func test_LinkedList_중간에_있는값3을_삭제했을때_3이반환되고_count가_줄어드는지() {
        //given
        sut.append(new: 1)
        sut.append(new: 2)
        sut.append(new: 3)
        sut.append(new: 4)
        
        //when
        let result = sut.removeAt(index: 3)
        
        //then
        XCTAssertEqual(result, 4)
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_LinkedList_맨앞에서_값이추가되어_head가_추가된값으로_반환되는지() {
        //given
        sut.append(new: 4)
        sut.append(new: 6)
        
        //when
        sut.prepend(item: 7)
        let head = sut.head?.data
        //then
        XCTAssertEqual(head, 7)
    }
}
