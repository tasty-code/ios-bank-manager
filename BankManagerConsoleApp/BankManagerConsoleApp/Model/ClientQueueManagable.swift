//
//  ClientQueueManagable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

protocol ClientEnqueuable {
    func enqueueClient(_ client: Client)
}

protocol ClientDequeuable {
    func dispatchClient() -> Client?
}

typealias ClientQueueManagable = ClientEnqueuable & ClientDequeuable
