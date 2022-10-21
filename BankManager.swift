//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    enum Menu: String {
        case open = "1"
        case close = "2"
    }
    
    enum ClientNumber: Int {
        case minimumNumber = 10
        case maximumNumber = 30
    }
    
    func setClientOfWaitingNumber(clientQueue: Queue<Client>) -> Queue<Client> {
        let clientNumber: Int = Int.random(in: ClientNumber.minimumNumber.rawValue...ClientNumber.maximumNumber.rawValue)
        let firstClient: Int = 1
        let lastClient: Int = clientNumber
        
        for getWaitingNumber in firstClient...lastClient {
            clientQueue.enqueue(data: Client(waitingNumber: getWaitingNumber))
        }
        return clientQueue
    }
    
    private func showMenu() {
        print("1 : 은행 개점" )
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    private func inputMenu() -> Menu? {
        guard let inputStringMenu = readLine() else {
            return nil
        }
        return Menu(rawValue: inputStringMenu)
    }
    
    private func selectedMenu() {
        while true {
            showMenu()
            let menu = inputMenu()
            switch menu {
            case .open:
                let bankClerk = BankClerk()
                bankClerk.work(waitingNumberQueue: BankManager())
                return
            case .close:
                return
            default:
                bankOpen()
                return
            }
        }
    }
    
    func bankOpen() {
        selectedMenu()
    }
}
