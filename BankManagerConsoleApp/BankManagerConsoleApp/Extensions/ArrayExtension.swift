//
//  ArrayExtension.swift
//  BankManagerConsoleApp
//
//  Created by 김용재 on 2023/03/03.
//

import Foundation

extension Array where Element: BankClerkProtocol {
    typealias WorkItem = DispatchWorkItem
    typealias Clerk = Element
    
    subscript(safe index: Int) -> Clerk? {
        guard index < self.count else { return nil }
        return self[index]
    }
    
    func actionMap(_ action: @escaping (Clerk, Int) -> WorkItem) -> [WorkItem] {
        return self.enumerated().map { action($1, $0) }
    }
}
