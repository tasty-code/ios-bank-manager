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
    
    func assist(_ client: Int){
        printMessage(message: .startAssist(client))
        usleep(Constants.managerExcutionTime)
        printMessage(message: .endAssist(client))
    }
}
