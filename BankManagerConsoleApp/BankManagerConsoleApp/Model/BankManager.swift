//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let bankers: [Banker]
    
    private let clientManager: [BankTaskType: any ClientEnqueuable]
    
    private let output: TextOutputDisplayable
    
    init(
        bankers: [Banker],
        clientManager: [BankTaskType: any ClientEnqueuable],
        output: TextOutputDisplayable
    ) {
        self.bankers = bankers
        self.clientManager = clientManager
        self.output = output
    }
    
    func start() {
        makeClientList()
        let group = DispatchGroup()
        let totalWorkTime = measure {
            for banker in bankers {
                banker.start(group: group)
            }
            group.wait()
        }
        summarizeDailyStatistics(totalWorkTime: totalWorkTime)
    }
}

private extension BankManager {
    func makeClientList() {
        let numberOfClient = Int.random(in: 10...30)
        
        for number in 1...numberOfClient {
            guard let bankTaskType = BankTaskType.random else { return }
            self.clientManager[bankTaskType]?.enqueueClient(number: number)
        }
    }
    
    func measure(_ progress: () -> Void) -> TimeInterval {
        let start = Date()
        progress()
        return Date().timeIntervalSince(start)
    }
    
    func summarizeDailyStatistics(totalWorkTime: Double) {
        let numberOfClient = self.bankers.map(\.dailyClientStatistics).reduce(0, +)
        let roundedWorkTimeString = String(format: "%.2f", totalWorkTime)
        let output = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(roundedWorkTimeString)초입니다."
        self.output.display(output: output)
    }
}
