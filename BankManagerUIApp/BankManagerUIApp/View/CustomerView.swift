
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
        setupConstraints()
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
    
    private func setupConstraints() {
        self.addSubview(label)
        self.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.setContentHuggingPriority(.defaultLow, for: .horizontal)
       
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
    }
}
