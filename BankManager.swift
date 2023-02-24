//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func assist(_ client: Int){
        print(ConsoleMessage.startAssist(client))
        usleep(ConsoleMessage.managerExcutionTime)
        print(ConsoleMessage.endAssist(client))
    }
}
