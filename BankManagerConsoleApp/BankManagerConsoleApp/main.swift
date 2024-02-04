import Foundation

func openBank() {
    let bankEmployee = Bank(bankEmployeeCount: 3)
    var bankManager = BankManager(bank: bankEmployee)

    while bankManager.fetchIsRunning() {
        bankManager.startBusiness()
    }
}

openBank()
