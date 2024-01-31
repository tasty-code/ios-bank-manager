import Foundation

struct Customer {
    static var nextNum = 0
    let numberTicket: Int
    let bankServices: Int = Int.random(in: 1...2)
    
    init() {
        self.numberTicket = Customer.nextNum
        Customer.nextNum += 1
    }
    
    
}
