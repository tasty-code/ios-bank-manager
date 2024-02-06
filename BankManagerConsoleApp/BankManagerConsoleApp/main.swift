import Foundation

let firstDepositBanker = Banker(service: .deposit)
let secondDepositBanker = Banker(service: .deposit)
let loanBanker = Banker(service: .loan)

let bankers = [firstDepositBanker, secondDepositBanker, loanBanker]

let depositSemaphore = DispatchSemaphore(value: 2)

let bank = Bank(bankers: bankers, depositSemaphore: depositSemaphore)
let bankManager = BankManager(bank: bank)
bankManager.openBank()
