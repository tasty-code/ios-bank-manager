//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

import Foundation

final class Banker {
    private let name: String
    
    private let dispatcher: ClientDequeuable
    
    private lazy var queue = DispatchQueue(
        label: String(describing: self),
        attributes: .concurrent
    )
    
    init(name: String, dispatcher: ClientDequeuable) {
        self.name = name
        self.dispatcher = dispatcher
    }
    
    func start(group: DispatchGroup) {
        queue.async(group: group) { [weak self] in
            guard let self else { return }
            while let client = dispatcher.dispatchClient() {
                work(for: client, time: 0.7)
            }
        }
    }
    
    private func work(for client: Client, time: Double) {
        self.startTask(for: client)
        Thread.sleep(forTimeInterval: time)
        self.endTask(for: client)
    }
    
    private func startTask(for client: Client) {
        print("\(self.name): \(client.number)번 고객 업무 시작")
    }
    
    private func endTask(for client: Client) {
        print("\(self.name): \(client.number)번 고객 업무 완료")
    }
}
