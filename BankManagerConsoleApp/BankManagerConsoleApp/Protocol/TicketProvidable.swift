//
//  TicketProvidable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 2/1/24.
//

protocol TicketProvidable {
    func provideTicket(of taskType: BankTask) -> Int?
}
