//
//  BankViewModel.swift
//  BankManagerUIApp
//
//  Created by EUNJU on 2024/02/08.
//

import Foundation

final class BankViewModel {

    private let repository = BankRepository()
    private let timer = BankTimer()
    
    private(set) var waitingClients: Observable<[Client]> = Observable([])
    private(set) var timeString: Observable<String> = Observable("")

    func fetchData() {
        repository.makeClientData { [weak self] result in
            self?.waitingClients.value += result
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
}
