//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 1/31/24.
//

struct Banker {
    private let bankerEnqueuable: BankerEnqueuable
    
    init(bankerEnqueuable: BankerEnqueuable) {
        self.bankerEnqueuable = bankerEnqueuable
    }
}

extension Banker: ClientTaskHandlable {
    func handle(client: Client) {
        // 시작
        // n초간 실행
        // client.task.process()
        // 종료
        
        // 셀프로 인큐
        self.bankerEnqueuable.enqueueBanker(self)
    }
}

