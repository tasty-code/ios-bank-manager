
import UIKit

class CustomLabel: UILabel {
    private let waitingNumber: Int
    private let serviceType: String
    
    init(waitingNumber: Int, serviceType: String) {
        self.waitingNumber = waitingNumber
        self.serviceType = serviceType
        super.init()
        self.text = "\(waitingNumber) - \(serviceType)"
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
