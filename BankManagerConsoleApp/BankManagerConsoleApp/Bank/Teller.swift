//
//  Teller.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Teller: ConsoleMessagable {
    enum Constants {
        static let tellerProcessingTime: [BankingType: UInt32] = [.loan: 1100000, .deposit: 700000]
    }
    let type: BankingType
    
    init(type: BankingType) {
        self.type = type
    }
    
    func assist(_ client: Client){
        printMessage(message: .startAssist(client.waitingNumber, type: client.type))
        usleep(processingTime)
        printMessage(message: .endAssist(client.waitingNumber, type: client.type))
    }

    private var processingTime: UInt32 {
        return Constants.tellerProcessingTime[type] ?? 0
    }
}
