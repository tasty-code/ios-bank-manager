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

    func test_비어있는_Linkedlist에_대하여_isEmpty가_true를_반환하는지_확인한다() throws {
        XCTAssertTrue(sut.isEmpty)
    }

    func test_append_입력_3에_대해서_추가되었는지_확인한다() throws {
        let input = 3
        sut.append(input)

        let expected = 3
        let result = sut.peek
        XCTAssertEqual(expected, result)
    }

    func test_3을_append하고_removeFirst_하면_3이_나오는지_확인하다() throws {
        let input = 3
        let expected = 3
        sut.append(input)
        let result = sut.removeFirst()
        XCTAssertEqual(expected, result)
    }

    func test_3_4_5_를_append하고_peek_하면_3이_나오는지_확인하다() throws {
        let inputs = [3, 4, 5]
        for input in inputs {
            sut.append(input)
        }

        let expected = 3
        let result = sut.peek
        XCTAssertEqual(expected, result)
    }

    func test_append_입력_3_4_5에_대해서_순서대로_추가되었는지_확인한다() throws {
        let inputs = [3, 4, 5]
        for input in inputs {
            sut.append(input)
        }

        let expected1 = 3
        let expected2 = 4
        let expected3 = 5
        let result1 = sut.removeFirst()
        let result2 = sut.removeFirst()
        let result3 = sut.removeFirst()
        XCTAssertEqual(expected1, result1)
        XCTAssertEqual(expected2, result2)
        XCTAssertEqual(expected3, result3)
    }

    func test_removeAll로_Linkedlist를_초기화_시키는지_확인한다() throws {
        let inputs = [3, 6, 9]
        for input in inputs {
            sut.append(input)
        }

        sut.removeAll()
        XCTAssertTrue(sut.isEmpty)
    }
}
