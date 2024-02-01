//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/31/24.
//

struct Banker {
    private let bankerEnqueuable: BankerEnqueuable
    
    private let resultOut: TextOutputDisplayable
    
    init(
        bankerEnqueuable: BankerEnqueuable,
        resultOut: TextOutputDisplayable
    ) {
        self.bankerEnqueuable = bankerEnqueuable
        self.resultOut = resultOut
    }
}

import Foundation

extension Banker: ClientTaskHandlable {
    func handle(client: Client, group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            resultOut.display(output: "\(client.number)번 고객 \(client.task.name) 시작")
            client.task.process()
            resultOut.display(output: "\(client.number)번 고객 \(client.task.name) 종료")
            self.bankerEnqueuable.enqueueBanker(self)
        }
    }
}

