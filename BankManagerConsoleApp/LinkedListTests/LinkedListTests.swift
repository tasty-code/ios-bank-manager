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

    func test_비어있는_리스트의_headValue가_nil이다() {
        let expectation = sut.headValue
        XCTAssertNil(expectation)
    }

    func test_비어있는_리스트의_isEmpty가_true이다() {
        let expectation = sut.isEmpty
        XCTAssertTrue(expectation)
    }

    func test_처음_append한_head의_값이_headValue가_된다() {
        let given = "iYeah"
        sut.append(given)

        let expectation = sut.headValue
        XCTAssertEqual(given, expectation)
    }

    func test_removeFirst시_첫번째_값이_반환된다() {
        let given = "iYeah"
        sut.append(given)

        let expectation = sut.removeFirst()
        XCTAssertEqual(given, expectation)
    }

    func test_하나의_값을_넣고_removeFirst시_headValue는_nil이다() {
        let given = "iYeah"
        sut.append(given)
        sut.removeFirst()

        let expectation = sut.headValue
        XCTAssertNil(expectation)
    }

    func test_removeFirst시_먼저_넣은_값의_순서대로_반환된다() {
        let givens = ["iYeah", "Mason", "vivi"]
        givens.forEach { sut.append($0) }

        givens.forEach { given in
            let expectation = sut.removeFirst()
            XCTAssertEqual(given, expectation)
        }
    }

    func test_removeFirst시_headValue가_다음값으로_변경된다() {
        let givens = ["iYeah", "Mason", "vivi"]
        givens.forEach { sut.append($0) }

        givens.forEach { given in
            let expectation = sut.headValue
            XCTAssertEqual(given, expectation)

            sut.removeFirst()
        }
    }

    func test_removeAll시_isEmpty가_true이다() {
        let givens = ["iYeah", "Mason", "vivi"]
        givens.forEach { sut.append($0) }

        sut.removeAll()
        let expectation = sut.isEmpty
        XCTAssertTrue(expectation)
    }

    func test_removeAll시_headValue이_nil이다() {
        let givens = ["iYeah", "Mason", "vivi"]
        givens.forEach { sut.append($0) }

        sut.removeAll()
        let expectation = sut.headValue
        XCTAssertNil(expectation)
    }
}
