//
//  UIText.swift
//  BankManagerUIApp
//
//  Created by Janine on 11/16/23.
//

import Foundation

enum UIText {
    static let addCustomerButton = "고객 10명 추가"
    static let resetButton = "초기화"
    static let waitingStationTitleLabel = "대기중"
    static let workingStationTitleLabel = "업무중"
    
    case customerLabel(ticketNumber: Int, serviceType: ServiceType)
    case workTimeLabel(time: Double)
    
    
    var displayText: String {
        switch self {
        case .customerLabel(let ticketNumber, let serviceType):
            return "\(ticketNumber) - \(serviceType.description)"
        case .workTimeLabel(let time):
            return "업무 시간 - \(time.timeFormatter())"
        }
    }
}
