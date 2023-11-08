//
//  BankManagable.swift
//  BankManagerConsoleApp
//
//  Created by BOMBSGIE on 2023/11/07.
//

import Foundation

protocol BankManagable {
    func startWork()
    func recept(for client: Client)
    func getTotalWorkTime() -> Double
}
