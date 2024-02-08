//
//  BankMirror.swift
//  BankManagerConsoleApp
//
//  Created by Effie on 2/5/24.
//

import Foundation

final class BankMirror {
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

extension BankMirror: BankIntput {
    func startBank() {
        self.bankManager.start()
    }
    
    func resetBank() {
        self.bankManager.clearBank()
    }
    
    func addClients(count: Int) {
        self.bankManager.addClients(count: count)
    }
}

extension BankMirror: BankManagerDelegate {
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

private extension BankMirror {
    func addWaitingClient(client: Client) {
        self.waitingSemaphore.wait()
        self.waitingList.append(client)
        self.waitingSemaphore.signal()
    }
    
    func removeWaitingClient(client: Client) {
        self.waitingSemaphore.wait()
        guard
            let index = self.waitingList.firstIndex(where: { target in client == target })
        else { return }
        self.waitingList.remove(at: index)
        self.waitingSemaphore.signal()
    }
    
    func addWorkingClient(client: Client) {
        self.workingSemaphore.wait()
        self.workingList.append(client)
        self.workingSemaphore.signal()
    }
    
    func removeWorkingClient(client: Client) {
        self.workingSemaphore.wait()
        guard
            let index = self.workingList.firstIndex(where: { target in client == target })
        else { return }
        self.workingList.remove(at: index)
        self.workingSemaphore.signal()
    }
    
    func clearClients() {
        self.waitingSemaphore.wait()
        self.waitingList.removeAll()
        self.workingList.removeAll()
        self.waitingSemaphore.signal()
    }
}

private extension BankMirror {
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

protocol BankOutput: AnyObject {
    func updateWaitingList(with: [Client])
    func updateWorkingList(with: [Client])
    func updateTime(with timeString: String)
}

protocol BankIntput: AnyObject {
    func startBank()
    func resetBank()
    func addClients(count: Int)
}
