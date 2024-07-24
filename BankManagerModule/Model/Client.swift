//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/26/24.
//

struct Client {
    let number: Int
    let task: BankTask
}

extension Client: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.number)
    }
}
