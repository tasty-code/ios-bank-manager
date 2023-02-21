//
//  LinkedQueueTest.swift
//  BankManagerConsoleAppTest
//
//  Created by Blu on 2023/02/21.
//

import XCTest

final class LinkedQueueTest: XCTestCase {

    var sut: LinkedQueue<Any>!

    override func setUpWithError() throws {
        try super.setUpWithError()

        sut = LinkedQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        sut = nil
    }

    func test_enqueue로_데이터가_들어가는지_확인() {
        sut.enqueue(data: "lust3r")

        let expectation = 1

        XCTAssertEqual(expectation, sut.count)
    }

    func test_dequeue로_데이터가_제거되는지_확인() {
        // given
        let expectation = 1

        sut.enqueue(data: "blue")
        sut.enqueue(data: "lust3r")

        // when
        sut.dequeue()

        // then
        XCTAssertEqual(expectation, sut.count)
    }

    func test_dequeue가_처음_추가한_데이터를_return하는지_확인() {
        // given
        let expectation = "blue"

        sut.enqueue(data: "blue")
        sut.enqueue(data: "lust3r")

        // when
        let result = sut.dequeue() as? String ?? ""

        // then
        XCTAssertEqual(expectation, result)
    }

    func test_아무것도_추가하지_않고_dequeue하는_경우_nil을_반환하는지_확인() {
        XCTAssertNil(sut.dequeue())
    }

    func test_clear로_queue가_비워지는지_확인() {
        // given
        let expectation = 0

        sut.enqueue(data: "blue")
        sut.enqueue(data: "lust3r")

        // when
        sut.clear()

        // then
        XCTAssertEqual(expectation, sut.count)
        XCTAssertNil(sut.front)
        XCTAssertNil(sut.rear)
    }

    func test_peek을_하면_가장_먼저_추가한_데이터가_나오는지_확인() {
        // given
        let expectation = "corn"

        sut.enqueue(data: "corn")
        sut.enqueue(data: "finnn")
        sut.enqueue(data: "jamking")

        // when
        let result = sut.peek() as? String ?? ""

        // then
        XCTAssertEqual(expectation, result)
    }

    func test_아무것도_추가하지_않고_peek하는_경우_nil을_반환하는지_확인() {
        XCTAssertNil(sut.peek())
    }

    func test_아무_데이터도_넣지_않았을_때_isEmpty가_true인지_확인() {
        XCTAssertTrue(sut.isEmpty())
    }

    func test_데이터를_넣었을_때_isEmpty가_false인지_확인() {
        sut.enqueue(data: "corn")
        sut.enqueue(data: "finnn")
        sut.enqueue(data: "jamking")

        XCTAssertFalse(sut.isEmpty())
    }
}
