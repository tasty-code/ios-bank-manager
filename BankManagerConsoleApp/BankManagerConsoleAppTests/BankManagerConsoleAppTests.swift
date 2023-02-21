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

    func test_append_입력_3에_대해서_제대로_추가되었는지_확인한다() throws {
        let input = 3
        let expected = 3
        sut.append(input)
        XCTAssertEqual(sut.head?.value, expected)
    }

    func test_append_입력_3_4_5에_대해서_제대로_추가되었는지_확인한다() throws {
        let input1 = 3
        let input2 = 4
        let input3 = 5
        let expected = 5
        sut.append(input1)
        sut.append(input2)
        sut.append(input3)
        XCTAssertEqual(sut.tail?.value, expected)
    }
}
