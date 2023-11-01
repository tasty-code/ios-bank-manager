//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private var clientQueue: Queue<Client> = Queue()
    
    func input() {
        print(Prompt.menu, terminator: "")
        guard let input = readLine() else { return }
        switch input {
        case "1":
            break
        case "2":
            break
        default:
            print("입력이 잘못되었습니다.")
            self.input()
        }
    }
    
    
    private func makeClientQueue() {
        let totalClient = Int.random(in: 10...30)

        for num in 1...totalClient {
            self.clientQueue.enqueue(data: Client(id: num))
        }
    }
}
