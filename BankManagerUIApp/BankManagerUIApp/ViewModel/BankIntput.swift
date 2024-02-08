//
//  BankIntput.swift
//  BankManagerUIApp
//
//  Created by Effie on 2/8/24.
//

protocol BankIntput: AnyObject {
    func startBank(withCount count: Int)
    func resetBank()
    func addClients(count: Int)
}
