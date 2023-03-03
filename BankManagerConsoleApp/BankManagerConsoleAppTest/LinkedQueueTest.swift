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
        // given
        let expectation = "lust3r"

        // when
        sut.enqueue(value: "lust3r")
        guard let result = sut.peek() as? String else { return }

        // then
        XCTAssertEqual(expectation, result)
    }

    func test_dequeue로_데이터가_제거되는지_확인() {
        // given
        let expectation = "blue"

        sut.enqueue(value: "blue")
        sut.enqueue(value: "lust3r")

        // when
        let result = sut.dequeue() as? String

        // then
        XCTAssertEqual(expectation, result)
    }

    func test_dequeue가_처음_추가한_데이터를_return하는지_확인() {
        // given
        let expectation = "blue"

        sut.enqueue(value: "blue")
        sut.enqueue(value: "lust3r")

        // when
        guard let dequeueResult = sut.dequeue() else { return }
        let result = "\(dequeueResult)"

        // then
        XCTAssertEqual(expectation, result)
    }

    func test_노드가_한개인_경우_dequeue했을_때_head와_tail이_nil인지_확인() {
        sut.enqueue(value: "lust3r")
        sut.dequeue()

        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }

    func test_아무것도_추가하지_않고_dequeue하는_경우_nil을_반환하는지_확인() {
        XCTAssertNil(sut.dequeue())
    }

    func test_clear로_queue가_비워지는지_확인() {
        // given
        sut.enqueue(value: "blue")
        sut.enqueue(value: "lust3r")

        // when
        sut.clear()

        // then
        XCTAssertNil(sut.head)
    }

    func test_peek을_하면_가장_먼저_추가한_데이터가_나오는지_확인() {
        // given
        let expectation = "corn"

        sut.enqueue(value: "corn")
        sut.enqueue(value: "finnn")
        sut.enqueue(value: "jamking")

        // when
        guard let peekResult = sut.peek() else { return }
        let result = "\(peekResult)"

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
        sut.enqueue(value: "corn")
        sut.enqueue(value: "finnn")
        sut.enqueue(value: "jamking")

        XCTAssertFalse(sut.isEmpty())
    }
}
