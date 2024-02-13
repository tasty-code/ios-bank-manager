//
//  BankViewModel.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 2/5/24.
//

import Foundation

final class BankViewModel {
    private let bankManager: BankManager
    
    weak var delegate: BankOutput?
    
    private var waitingList: [Client] {
        didSet {
            self.delegate?.updateWaitingList(with: self.waitingList)
        }
    }
    
    private var workingList: [Client] {
        didSet {
            self.delegate?.updateWorkingList(with: self.workingList)
        }
    }
    
    private var timeString: String {
        didSet {
            self.delegate?.updateTime(with: self.timeString)
        }
    }
    
    private var waitingSemaphore = DispatchSemaphore(value: 1)
    
    private var workingSemaphore = DispatchSemaphore(value: 1)
    
    init(
        bankManager: BankManager
    ) {
        self.waitingList = []
        self.workingList = []
        self.bankManager = bankManager
        self.timeString = "업무시간 - \("00:00:000")"
    }
}

// MARK: - BankIntput
extension BankViewModel: BankIntput {
    func startBank(withCount count: Int) {
        self.bankManager.start(with: count)
    }
    
    func resetBank() {
        self.bankManager.resetBank()
    }
    
    func addClients(count: Int) {
        self.bankManager.addClients(count: count)
    }
}

// MARK: - BankManagerDelegate
extension BankViewModel: BankManagerDelegate {
    func handleDequeueClient(client: Client) {
        DispatchQueue.global().async {
            self.waitingSemaphore.wait()
            guard
                let index = self.waitingList.firstIndex(where: { target in client == target })
            else {
                self.waitingSemaphore.signal()
                return
            }
            self.waitingList.remove(at: index)
            self.waitingSemaphore.signal()
        }
    }
    
    func handleEnqueueClient(client: Client) {
        DispatchQueue.global().async {
            self.waitingSemaphore.wait()
            self.waitingList.append(client)
            self.waitingSemaphore.signal() 
        }
    }
    
    func handleEndTask(client: Client) {
        DispatchQueue.global().async {
            self.workingSemaphore.wait()
            guard
                let index = self.workingList.firstIndex(where: { target in client == target })
            else {
                self.workingSemaphore.signal()
                return
            }
            self.workingList.remove(at: index)
            self.workingSemaphore.signal()
        }
    }
    
    func handleStartTask(client: Client) {
        DispatchQueue.global().async {
            self.workingSemaphore.wait()
            self.workingList.append(client)
            self.workingSemaphore.signal()
        }
    }
    
    func handleClearClient() {
        DispatchQueue.global().async {
            self.waitingSemaphore.wait()
            self.workingSemaphore.wait()
            self.waitingList.removeAll()
            self.workingList.removeAll()
            self.waitingSemaphore.signal()
            self.workingSemaphore.signal()
        }
    }
    
    func handleTimer(timeString: String) {
        self.timeString = timeString
    }
}
