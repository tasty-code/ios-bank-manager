//
//  QueueTests.swift
//  QueueTests
//
//  Created by Bora Yang on 2023/02/23.
//

import XCTest

final class QueueTests: XCTestCase {

    var sut: Queue<String>!

    override func setUpWithError() throws {
        sut = Queue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_비어있는_큐의_peek가_nil이다() {
        let expectation = sut.peek
        XCTAssertNil(expectation)
    }

    func test_비어있는_큐의_isEmpty가_true이다() {
        let expectation = sut.isEmpty
        XCTAssertTrue(expectation)
    }

    func test_처음_enqueue한_head의_값이_peek가_된다() {
        let value = "iYeah"
        sut.enqueue(value)

        let expectation = sut.peek
        XCTAssertEqual(value, expectation)
    }

    func test_dequeue시_첫번째_값이_반환된다() {
        let value = "iYeah"
        sut.enqueue(value)

        let expectation = sut.dequeue()
        XCTAssertEqual(value, expectation)
    }

    func test_하나의_값을_넣고_dequeue시_peek는_nil이다() {
        let value = "iYeah"
        sut.enqueue(value)
        sut.dequeue()

        let expectation = sut.peek
        XCTAssertNil(expectation)
    }

    func test_dequeue시_먼저_넣은_값의_순서대로_반환된다() {
        let values = ["iYeah", "Mason", "vivi"]
        values.forEach { sut.enqueue($0) }

        values.forEach { value in
            let expectation = sut.dequeue()
            XCTAssertEqual(value, expectation)
        }
    }

    func test_dequeue시_peek가_다음값으로_변경된다() {
        let values = ["iYeah", "Mason", "vivi"]
        values.forEach { sut.enqueue($0) }

        values.forEach { value in
            let expectation = sut.peek
            XCTAssertEqual(value, expectation)

            sut.dequeue()
        }
    }

    func test_clear시_isEmpty가_true이다() {
        let values = ["iYeah", "Mason", "vivi"]
        values.forEach { sut.enqueue($0) }

        sut.clear()
        let expectation = sut.isEmpty
        XCTAssertTrue(expectation)
    }

    func test_clear시_peek가_nil이다() {
        let values = ["iYeah", "Mason", "vivi"]
        values.forEach { sut.enqueue($0) }

        sut.clear()
        let expectation = sut.peek
        XCTAssertNil(expectation)
    }
}
