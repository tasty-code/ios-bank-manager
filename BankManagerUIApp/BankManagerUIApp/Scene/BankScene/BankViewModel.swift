//
//  BankViewModel.swift
//  BankManagerUIApp
//
//  Created by EUNJU on 2024/02/08.
//

import Foundation

final class BankViewModel {
    
    // MARK: Properties
    private let repository = BankRepository()
    private let timer = BankTimer()
    
    private(set) var waitingClients: Observable<[Client]> = Observable([])
    private(set) var workingClients: Observable<[Client]> = Observable([])
    private(set) var timeString: Observable<String> = Observable("")
    private let loanSemaphore = DispatchSemaphore(value: 1)
    private let depositSemaphore = DispatchSemaphore(value: 2)
    
    // MARK: Custom Methods
    func fetchData() {
        repository.makeClientData { [weak self] result in
            self?.waitingClients.value += result
            self?.startTask()
            self?.start()
        }
    }
    
    func fetchTimeString() {
        timer.timeString = {
            self.timeString.value = $0
        }
    }
    
    func start() {
        timer.start()
        fetchTimeString()
    }
    
    func stop() {
        timer.stop()
    }
    func startTask() {
        while !waitingClients.value.isEmpty {
            let client = waitingClients.value.removeFirst()
            workingClients.value.append(client)
            handleTask(of: client)
        }
    }
    
    private func handleTask(of client: Client) {
        let semaphore = client.bankTask == .loan ? loanSemaphore : depositSemaphore
    
        semaphore.wait()
        DispatchQueue.global().async { [weak self] in
            guard let self = self else {return}
            Thread.sleep(forTimeInterval: client.bankTask.requiredTime)
            if self.workingClients.value.isEmpty { return }
            self.workingClients.value.removeFirst()
            semaphore.signal()
        }
    }
}
