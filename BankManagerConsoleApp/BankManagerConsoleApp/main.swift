import Foundation

func bankOpen() {
    var bankEmployee = BankManager()
    
    while bankEmployee.fetchIsRunning() {
        bankEmployee.startBusiness()
    }
}

bankOpen()
