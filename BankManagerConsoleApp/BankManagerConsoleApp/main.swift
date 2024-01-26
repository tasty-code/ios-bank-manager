//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Customer {
    let number: Int
}

protocol CustomerDispatchable {
    func dispatchCustomer() -> Customer?
}

final class CustomerDispatcher: CustomerDispatchable {
    private let customerQueue: Queue<Customer>
    
    init(customerQueue: Queue<Customer>) {
        self.customerQueue = customerQueue
    }
    
    func dispatchCustomer() -> Customer? {
        return self.customerQueue.dequeue()
    }
}

final class Banker {
    private let name: String
    
    private let dispatcher: CustomerDispatchable
    
    private let queue = DispatchQueue.global()
    
    init(name: String, dispatcher: CustomerDispatchable) {
        self.name = name
        self.dispatcher = dispatcher
    }
    
    func start(group: DispatchGroup) {
        // 얘를 아이템으로 만들면 좋을 듯
        queue.async(group: group) { [weak self] in
            guard let self else { return }
            while let newComer = dispatcher.dispatchCustomer() {
                work(for: newComer, time: 0.7)
            }
        }
    }
    
    private func work(for newComer: Customer, time: Double) {
        self.newComerStart(number: newComer.number)
        Thread.sleep(forTimeInterval: time)
        self.newComerEnd(number: newComer.number)
    }
    
    private func newComerStart(number: Int) {
        print("\(self.name): \(number)번 고객 업무 시작")
    }
    
    private func newComerEnd(number: Int) {
        print("\(self.name): \(number)번 고객 업무 완료")
    }
}

func makeList() -> LinkedList<Customer> {
    let result = LinkedList<Customer>()
    for number in 1...10 {
        let customer = Customer(number: number)
        result.add(value: customer)
    }
    return result
}

func test() {
    let list = makeList()
    let customerDispatcher: CustomerDispatchable = CustomerDispatcher(customerQueue: Queue(linkedList: list))
    
    let group = DispatchGroup()
    
    var bankers: [Banker] = [
        Banker.init(name: "에피", dispatcher: customerDispatcher),
        Banker.init(name: "카일", dispatcher: customerDispatcher),
        Banker.init(name: "디오", dispatcher: customerDispatcher),
    ]
    
    for banker in bankers {
        banker.start(group: group)
    }
    
    group.wait()
}

test()
