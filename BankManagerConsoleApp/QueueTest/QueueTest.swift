//
//  QueueTest.swift
//  QueueTest
//
//  Created by 박도원 on 2022/10/12.
//

import XCTest

final class QueueTest: XCTestCase {
    var list = LinkedList<Int>()

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test() {
        list.append(data: 3)
        list.append(data: 4)
        let a = list.returnFirstValue()
        
        print(a)
    }

}
