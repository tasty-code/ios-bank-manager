//
//  TaskManagable.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/31/24.
//

import Foundation

protocol TaskManagable {
    func startTaskManaging(group: DispatchGroup)
}
