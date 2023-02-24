//
//  Teller.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Teller {
    func assist(_ client: Int){
        print(ConsoleMessage.startAssist(client))
        usleep(Constants.managerExcutionTime)
        print(ConsoleMessage.endAssist(client))
    }
}
