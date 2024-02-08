//
//  BankOutput.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/8/24.
//

protocol BankOutput: AnyObject {
    func updateWaitingList(with: [Client])
    func updateWorkingList(with: [Client])
    func updateTime(with timeString: String)
}
