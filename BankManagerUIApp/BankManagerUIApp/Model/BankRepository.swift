//
//  BankRepository.swift
//  BankManagerUIApp
//
//  Created by EUNJU on 2024/02/08.
//

import Foundation

final class BankRepository {
    
    private var clientNumber: Int = 1
    
    func makeClientData(onCompleted: @escaping ([Client]) -> Void) {
        let startNumber = clientNumber
        var waitingQueue: [Client] = []
        
        (startNumber..<(startNumber + 10)).forEach {
            guard let task = BankTask.allCases.randomElement() else { return }
            waitingQueue.append(Client(number: $0, bankTask: task))
        }
        
        clientNumber += 10
        onCompleted(waitingQueue)
    }
}
