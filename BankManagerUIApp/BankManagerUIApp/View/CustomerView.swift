
import UIKit

class CustomerView: UIView {
    private var label:  UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title3)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabelText(customerNumber: Int, serviceType: String) {
        self.label.text = "\(customerNumber) - \(serviceType)"
    }
    
    func setLabelColor(_ color: UIColor) {
        self.label.textColor = color
    }
}
