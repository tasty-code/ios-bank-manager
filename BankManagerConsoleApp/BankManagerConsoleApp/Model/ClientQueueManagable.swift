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

protocol ClientCountProvidable {
    var numberOfClient: Int { get }
}

typealias ClientQueueManagable = ClientEnqueuable & ClientDequeuable & ClientCountProvidable
