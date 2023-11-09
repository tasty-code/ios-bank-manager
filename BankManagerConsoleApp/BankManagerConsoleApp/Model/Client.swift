//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 김진웅 on 2023/11/01.
//

import Foundation

struct Client {
    let id: Int
    let taskType: TaskType = TaskType.allCases.randomElement() ?? .deposit
}
