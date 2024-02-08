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
            updateWaitingList()
        }
    }
    
    private var workingList: [Client] {
        didSet {
            updateWorkingList()
        }
    }
    
    private var timeString: String {
        didSet {
            updateTime()
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
        removeWaitingClient(client: client)
    }
    
    func handleEnqueueClient(client: Client) {
        addWaitingClient(client: client)
    }
    
    func handleEndTask(client: Client) {
        removeWorkingClient(client: client)
    }

    func handleStartTask(client: Client) {
        addWorkingClient(client: client)
    }

    func handleClearClient() {
        clearClients()
    }
    
    func handleTimer(timeString: String) {
        self.timeString = timeString
    }
}

// MARK: - Private Methods
private extension BankViewModel {
    func addWaitingClient(client: Client) {
        DispatchQueue.global().async {
            self.waitingSemaphore.wait()
            self.waitingList.append(client)
            self.waitingSemaphore.signal()
        }
    }
    
    func removeWaitingClient(client: Client) {
        DispatchQueue.global().async {
            self.waitingSemaphore.wait()
            guard
                let index = self.waitingList.firstIndex(where: { target in client == target })
            else { return }
            self.waitingList.remove(at: index)
            self.waitingSemaphore.signal()
        }
    }
    
    func addWorkingClient(client: Client) {
        DispatchQueue.global().async {
            self.workingSemaphore.wait()
            self.workingList.append(client)
            self.workingSemaphore.signal()
        }
    }
    
    func removeWorkingClient(client: Client) {
        DispatchQueue.global().async {
            self.workingSemaphore.wait()
            guard
                let index = self.workingList.firstIndex(where: { target in client == target })
            else { return }
            self.workingList.remove(at: index)
            self.workingSemaphore.signal()
        }
    }
    
    func clearClients() {
        DispatchQueue.global().async {
            self.waitingSemaphore.wait()
            self.waitingList.removeAll()
            self.workingList.removeAll()
            self.waitingSemaphore.signal()
        }
    }
}

private extension BankViewModel {
    func updateWaitingList() {
        self.delegate?.updateWaitingList(with: self.waitingList)
    }
    
    func updateWorkingList() {
        self.delegate?.updateWorkingList(with: self.workingList)
    }
    
    func updateTime() {
        self.delegate?.updateTime(with: self.timeString)
    }
}
