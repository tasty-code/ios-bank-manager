//
//  ClientTaskHandlable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/31/24.
//

import Foundation

protocol ClientTaskHandlable {
    func handle(client: Client, group: DispatchGroup)
}
