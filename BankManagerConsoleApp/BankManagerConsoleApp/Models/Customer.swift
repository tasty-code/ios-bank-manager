import Foundation

struct Customer {

    let numberTicket: Int
    let bankServices: Task?
    
    init(numberTicket: Int, bankServices: Task? = nil) {
        self.numberTicket = numberTicket
        self.bankServices = bankServices
    }
}
