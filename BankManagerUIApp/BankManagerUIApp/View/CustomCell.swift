
import UIKit

class CustomCell: UITableViewCell {
    static var className: String { String(describing: self) }
    
    private var label:  UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    func setLabelText(customerNumber: Int, serviceType: String) {
        self.label.text = "\(customerNumber) - \(serviceType)"
    }
    
    func setLabelColor(_ color: UIColor) {
        self.label.textColor = color
    }
}
