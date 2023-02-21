//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by 박재우 on 2023/02/21.
//

import XCTest

final class BankManagerConsoleAppTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_append_입력_3에_대해서_추가되었는지_확인한다() throws {
        let input = 3
        let expected = 3
        sut.append(input)
        XCTAssertEqual(sut.head?.value, expected)
    }

    func test_append_입력_3_4_5에_대해서_추가되었는지_확인한다() throws {
        let input1 = 3
        let input2 = 4
        let input3 = 5
        let expected = 5
        sut.append(input1)
        sut.append(input2)
        sut.append(input3)
        XCTAssertEqual(sut.tail?.value, expected)
    }

    func test_3을_append하고_removeFirst_하면_3이_나오는지_확인하다() throws {
        let input = 3
        let expected = 3
        sut.append(input)
        let result = sut.removeFirst()
        XCTAssertEqual(expected, result)
    }

    func test_비어있는_Linkedlist에_대하여_isEmpty가_true를_반환하는지_확인한다() throws {
        XCTAssertTrue(sut.isEmpty())
    }

    func test_비어있지_않은_Linkedlist에_대하여_isEmpty가_false를_반환하는지_확인한다() throws {
        sut.append(9)
        XCTAssertFalse(sut.isEmpty())
    }

    func test_clear로_Linkedlist를_초기화_시키는지_확인한다() throws {
        sut.append(3)
        sut.append(6)
        sut.append(9)
        sut.clear()
        XCTAssertTrue(sut.isEmpty())
    }
}
