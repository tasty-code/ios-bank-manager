//
//  BankViewModel.swift
//  BankManagerUIApp
//
//  Created by EUNJU on 2024/02/08.
//

import Foundation

final class BankViewModel {

    private let repository = BankRepository()
    
    private(set) var waitingClients: Observable<[Client]> = Observable([])
    
    func fetchData() {
        repository.makeClientData { [weak self] result in
            self?.waitingClients.value += result
        }
    }
}
