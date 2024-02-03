import Foundation

let banker1 = Banker()
let banker2 = Banker()
let banker3 = Banker()

let bankers = [banker1, banker2, banker3]

let depositSemaphore = DispatchSemaphore(value: 2)
let loanSemaphore = DispatchSemaphore(value: 1)

let bank = Bank(bankers: bankers, depositSemaphore: depositSemaphore, loanSemaphore: loanSemaphore)
let bankManager = BankManager(bank: bank)
bankManager.openBank()
