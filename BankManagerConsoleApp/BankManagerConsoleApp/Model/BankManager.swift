//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


final class BankManager {
    private var clientQueue = Queue<Client>()
    
    func recept(client: Client) {
        self.clientQueue.enqueue(client)
    }
}
