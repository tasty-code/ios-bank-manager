//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Bora Yang on 2023/02/22.
//

import XCTest

final class LinkedListTests: XCTestCase {

    var sut: LinkedList<String>!

    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_비어있는_리스트의_peek가_nil이다() {
        XCTAssertNil(sut.peek)
    }

    func test_비어있는_리스트의_isEmpty가_true이다() {
        XCTAssertTrue(sut.isEmpty)
    }

    func test_처음_append한_head의_값이_peek가_된다() {
        let value = "iYeah"
        sut.append(value)

        let expectation = sut.peek
        XCTAssertEqual(value, expectation)
    }
}
