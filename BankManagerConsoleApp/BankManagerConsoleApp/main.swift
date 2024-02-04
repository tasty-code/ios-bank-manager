import Foundation

let banker1 = Banker(service: .deposit)
let banker2 = Banker(service: .deposit)
let banker3 = Banker(service: .loan)

let bankers = [banker1, banker2, banker3]

let depositSemaphore = DispatchSemaphore(value: 2)
let loanSemaphore = DispatchSemaphore(value: 1)

let bank = Bank(bankers: bankers, depositSemaphore: depositSemaphore)
let bankManager = BankManager(bank: bank)
bankManager.openBank()
