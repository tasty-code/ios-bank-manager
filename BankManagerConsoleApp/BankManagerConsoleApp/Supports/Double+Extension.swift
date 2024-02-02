import Foundation

extension Double {
    
    func formatTimeToTwoDecimalPlaces() -> Double {
        return Double(String(format: CustomStringPrintMenu.format.description, self)) ?? 0.0
    }
}
