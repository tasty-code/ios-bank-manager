//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by DONGWOOK SEO on 2023/02/27.
//

import Foundation

struct Teller: TellerProvidable {
    // MARK: - Private property
    func working() {
        Namespace.workTime.sleep()
    }
    
    func call(waitingNumber: UInt, result: Bool) {
        InputOutputManager.output(state: .working(waitingNumber, result))
    }

}
