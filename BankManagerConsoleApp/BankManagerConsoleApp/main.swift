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
    private let dispatcher: CustomerDispatchable
    
    init(dispatcher: CustomerDispatchable) {
        self.dispatcher = dispatcher
    }
    
    func start(group: DispatchGroup) {
        DispatchQueue.global().async(group: group) { [weak self] in
            guard let self else { return }
            while let newComer = dispatcher.dispatchCustomer() {
                self.newComerStart(number: newComer.number)
                sleep(1)
                self.newComerEnd(number: newComer.number)
            }
        }
    }
    
    private func newComerStart(number: Int) {
        print("\(number)번 고객 업무 시작")
    }
    
    private func newComerEnd(number: Int) {
        print("\(number)번 고객 업무 완료")
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
    
    let bankers = [
        Banker(dispatcher: customerDispatcher),
        Banker(dispatcher: customerDispatcher),
        Banker(dispatcher: customerDispatcher),
    ]
    
    let group = DispatchGroup()
    
    for banker in bankers {
        banker.start(group: group)
    }
    
    group.wait()
}



test()
