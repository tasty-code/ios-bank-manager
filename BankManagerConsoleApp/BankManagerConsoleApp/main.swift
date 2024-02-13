import Foundation

// MARK: - Banker
let firstDepositBanker = Banker(service: .deposit)
let secondDepositBanker = Banker(service: .deposit)
let loanBanker = Banker(service: .loan)

let bankers = [firstDepositBanker, secondDepositBanker, loanBanker]

// MARK: - semaphore
let depositSemaphore = DispatchSemaphore(value: 2)

// MARK: - customerQueue
var customerQueue: [BankingService: Queue<Customer>] = [:]

let depositQueue = Queue<Customer>()
let loanQueue = Queue<Customer>()

customerQueue[.deposit] = depositQueue
customerQueue[.loan] = loanQueue

// MARK: - bank
let bank = Bank(bankers: bankers, depositSemaphore: depositSemaphore, customersQueue: customerQueue)
// MARK: - bankManager
let bankManager = BankManager(bank: bank)

bankManager.openBank()
