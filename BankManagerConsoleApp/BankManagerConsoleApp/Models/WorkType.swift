//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by Wonji Ha on 2023/11/02.
//

import Foundation

enum WorkType: CustomStringConvertible {
    case work
    
    var description: String {
        switch self {
        case .work:
            "업무"
        }
    }
}
