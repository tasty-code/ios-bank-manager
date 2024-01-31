import Foundation

extension Double {
    
    func formatTimeToTwoDecimalPlaces() -> Double {
        return Double(String(format: CustomString.format.description, self)) ?? 0.0
    }
}
