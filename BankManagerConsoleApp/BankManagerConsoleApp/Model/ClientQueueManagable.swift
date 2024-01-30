//
//  ClientQueueManagable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

protocol ClientEnqueuable {
    associatedtype TaskType: Task
    func enqueueClient(_ client: Client<TaskType>)
}

protocol ClientDequeuable {
    associatedtype TaskType: Task
    func dequeueClient() -> Client<TaskType>?
}

typealias ClientQueueManagable = ClientEnqueuable & ClientDequeuable
