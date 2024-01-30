//
//  ClientQueueManagable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

protocol ClientEnqueuable {
    associatedtype TaskType: Task
    func enqueueClient(number: Int)
}

protocol ClientDequeuable {
    associatedtype TaskType: Task
    func dequeueClient() -> Client?
}

typealias ClientQueueManagable = ClientEnqueuable & ClientDequeuable
