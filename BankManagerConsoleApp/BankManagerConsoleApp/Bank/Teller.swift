//
//  Teller.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Teller: ConsoleMessagable {
    func assist(_ client: Int){
        printMessage(message: .startAssist(client))
        usleep(Constants.managerExcutionTime)
        printMessage(message: .endAssist(client))
    }
}
