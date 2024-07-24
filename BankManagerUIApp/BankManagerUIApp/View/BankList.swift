//
//  BankList.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/7/24.
//

import UIKit

enum BankList {
    case waiting
    case working
    
    var backgroundColor: UIColor? {
        switch self {
        case .waiting: return BMColor.green
        case .working: return BMColor.purple
        }
    }
    
    var name: String {
        switch self {
        case .waiting: return "대기중"
        case .working: return "작업중"
        }
    }
}
