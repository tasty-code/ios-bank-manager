import Foundation

struct Bank {
    
    private let bankEmployeeCount: Int
    private var businessHour: Double = 0.0

    init(bankEmployeeCount: Int) {
        self.bankEmployeeCount = bankEmployeeCount
    }
}

// MARK: - Bank Method
extension Bank {

    func fetchTime() -> Double {
        return businessHour.formatTimeToTwoDecimalPlaces()
    }
    
    mutating func addProcessTime(_ time: Double) {
        businessHour += time
    }
}
