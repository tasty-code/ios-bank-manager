//
//  Teller.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Teller: ConsoleMessagable {
    let type: BankingType
    
    init(type: BankingType) {
        self.type = type
    }
    
    func assist(_ client: Client){
        printMessage(message: .startAssist(client.waitingNumber, type: client.type))
        usleep(Constants.managerExcutionTime)
        printMessage(message: .endAssist(client.waitingNumber, type: client.type))
    }
}
