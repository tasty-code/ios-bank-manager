//
//  ClientQueueManagable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

protocol ClientEnqueuable {
    func enqueueClient(client: Client)
}

protocol ClientDequeuable {
    func dequeueClient() -> Client?
}

protocol ClientClearable {
    func clearClients()
}

typealias ClientQueueManagable = ClientEnqueuable & ClientDequeuable & ClientClearable
